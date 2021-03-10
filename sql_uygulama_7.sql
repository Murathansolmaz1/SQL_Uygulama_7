select 

--O.ID AS SIPARISID,
--O.DATE_ AS SIPARISTARIHI,
--I.DATE_ AS FATURATARİHİ,
-- ortalama telimat süresi AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ORTALAMA_TESLIMATSURESİ_SAAT

U.ID, U.NAMESURNAME,
AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ORTALAMA_TESLIMATSURESİ_SAAT,
MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENKISA_TESLIMATSURESİ_SAAT,
MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS ENUZUN_TESLIMATSURESİ_SAAT,
SUM(O.TOTALPRICE) AS TOPLAM_SIPARIS_TUTARI,
COUNT(O.ID) AS SIPARISSAYISI

from ORDERS AS O

	INNER JOIN USERS AS U ON U.ID = O.USERID
	INNER JOIN ADDRESS AS A ON A.ID = O.ADDRESSID
	INNER JOIN CITIES AS C ON C.ID = A.CITYID
	INNER JOIN TOWNS AS T ON T.ID = A.TOWNID
	INNER JOIN DISTRICTS AS D ON D.ID = A.DISTRICTID
	INNER JOIN PAYMENTS AS P ON P.ORDERID = O.ID
	INNER JOIN INVOICES AS I ON I.ORDERID = O.ID 


GROUP BY U.ID, U.NAMESURNAME
HAVING AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_))>11
ORDER BY 6 DESC
