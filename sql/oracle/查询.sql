近三天 分页
SELECT
	* 
FROM
	(
	SELECT
		a.*,
		ROWNUM rn 
	FROM
		(
		SELECT
			Y.YQBH yqbh,
			YQBT title,
			YQNR content,
			ZSMC state,
			XQMC county,
			SFMC province,
			QGLX emotion,
			TO_CHAR( ZQRQ, 'yyyy-MM-dd' ) time,
			YQURL source,
			L.LXDM comecode,
			L.YQLX comefrom 
		FROM
			YD_FYXX F,
			YD_YQXX Y,
			YD_FYYQGL G,
			YZ_SFXX S,
			YZ_XQXX X,
			YZ_ZSXX Z,
			YD_YQGD D,
			YZ_QG Q,
			YZ_YQLX L 
		WHERE
			F.FYDM = G.FYDM 
			AND F.SFDM = S.SFDM ( + ) 
			AND F.XQDM = X.XQDM ( + ) 
			AND F.ZSDM = Z.ZSDM ( + ) 
			AND Y.YQBH = D.YQBH 
			AND D.QGDM = Q.QGDM 
			AND Y.YQBH = G.YQBH 
			AND Y.LXDM = L.LXDM 
			AND TO_CHAR( FBSJ, 'YYYY-MM-DD' ) >= TO_CHAR( SYSDATE - 3, 'YYYY-MM-DD' ) 
			AND TO_CHAR( FBSJ, 'YYYY-MM-DD' ) <= TO_CHAR( SYSDATE, 'YYYY-MM-DD' ) 
		) a 
	WHERE
		ROWNUM < 11 
	) 
WHERE
	rn > 0



求和 分组
SELECT
	SFDM,SUM(TJXX)
FROM
	YT_FYCJ T,
	YD_FYXX D
WHERE
	T.FYDM = D.FYDM 
GROUP BY SFDM 


左连接 排序
SELECT
	t1.SJMC,
	t2.FYMC,
	TO_CHAR( t1.CJSJ, 'yyyy-MM-dd' ) cjsj1 
FROM
	YD_FYRDSJ t1,
	YD_FYXX t2 
WHERE
	t1.FYDM = t2.FYDM ( + ) 
	AND SFDM = 530000 
ORDER BY
	CJSJ DESC

联合查询
--最后一个时间，不同类型的统计数量
SELECT
	LXDM,
	SUM( TJXX ) 
FROM
	YT_FYMT 
WHERE
	FYDM = '530000' 
	AND TJSJ = ( SELECT MAX( TJSJ ) FROM YT_FYMT WHERE FYDM = '530000' ) 
GROUP BY
	LXDM


多个求和
--不同时间总量,分媒体

SELECT TJSJ,SUM(TJXX)，
SUM(CASE WHEN LXDM='2'  THEN TJXX ELSE NULL END )，
SUM(CASE WHEN LXDM='0'  THEN TJXX ELSE NULL END )，
SUM(CASE WHEN LXDM='1'  THEN TJXX ELSE NULL END )，
SUM(CASE WHEN LXDM='3'  THEN TJXX ELSE NULL END )
FROM YT_FYMT
WHERE FYDM = '530000'
GROUP BY TJSJ