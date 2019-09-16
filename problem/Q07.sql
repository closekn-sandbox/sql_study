-- 7.1 下記SELECTの結果
SELECT * FROM Shohin
  UNION
SELECT * FROM Shohin
  INTERSECT
SELECT * FROM Shohin
ORDER BY shohin_id;
  ---- SELECT * FROM Shohin と同様

-- 7.2 外部結合においてNULLを文字列'不明'へと置き換える
SELECT COALESCE(TS.tenpo_id, '不明') AS tenpo_id, COALESCE(TS.tenpo_mei, '不明') AS tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS RIGHT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;
