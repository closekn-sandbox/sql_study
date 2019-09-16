-- 8.1 次のSELECT文の結果
SELECT shohin_id, shohin_mei, hanbai_tanka, MAX(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_max_tanka
FROM Shohin;
  ---- id順に見たときの現時点での最大販売単価列が追加される

-- 8.2 登録日の昇順に並べたとき、各日付時点の販売単価の合計金額
SELECT shohin_id, shohin_mei, hanbai_tanka, torokubi, SUM(hanbai_tanka) OVER (ORDER BY torokubi NULLS FIRST) AS current_sum_tanka
FROM Shohin
ORDER BY torokubi NULLS FIRST;
