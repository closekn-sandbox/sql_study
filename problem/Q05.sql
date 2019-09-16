-- 5.1 以下3条件を満たすビュー「ViewRenshu5_1」の作成
  -- 1. 販売単価が1000円以上
  -- 2. 登録日が2009/09/20
  -- 3. 含む列は、商品名、販売単価、登録日
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
SELECT shohin_mei, hanbai_tanka, torokubi
FROM Shohin
WHERE hanbai_tanka >= 1000 AND torokubi = '2009-09-20';

-- 5.2 下記INSERTの結果
INSERT INTO ViewRenshu5_1 VALUES ('ナイフ', 300, '2009-11-02');
  ---- ShohinテーブルのNOT NULL定義に反するためエラー

-- 5.3 例結果の表示が可能なSELECT
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin) AS hanbai_tanka_all
FROM Shohin;

-- 5.4 例結果のデータをもつビューの作成
CREATE VIEW AvgTankaByBunrui (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
AS
SELECT shohin_mei, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin AS S2 WHERE S1.shohin_bunrui = S2.shohin_bunrui)
FROM Shohin AS S1;
