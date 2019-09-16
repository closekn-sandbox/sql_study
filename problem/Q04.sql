-- 4.1 Aさんが下記実行後に、Bさんが下記実行した結果
-- A --
BEGIN TRANSACTION;
  INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2008-09-20');
  INSERT INTO Shohin VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2008-09-11');
  INSERT INTO Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
-- B --
SELECT * FROM Shohin;
  ---- 0rows (COMMITするまで変更は適用されない)

-- 4.2 下記INSERTの結果はどうなるか
INSERT INTO Shohin SELECT * FROM Shohin;
  ---- 商品IDが主キーのためエラー

-- 4.3 商品差益テーブルを作成して、データ登録
CREATE TABLE ShohinSaeki (
  shohin_id CHAR(4) NOT NULL,
  shohin_mei VARCHAR(100) NOT NULL,
  hanbai_tanka INTEGER,
  shiire_tanka INTEGER,
  saeki INTEGER,
  PRIMARY KEY(shohin_id)
);

INSERT INTO ShohinSaeki (shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
FROM Shohin;

-- 4.4 商品差益テーブルに対しての変更
BEGIN TRANSACTION;
  -- 1. カッターシャツの販売価格を4000円から3000円に引き下げる
  UPDATE ShohinSaeki
  SET hanbai_tanka = 3000
  WHERE shohin_mei = 'カッターシャツ';
  -- 2. その結果を受けて、カッターシャツの差益を再計算する
  UPDATE ShohinSaeki
  SET saeki = hanbai_tanka - shiire_tanka
  WHERE shohin_mei = 'カッターシャツ';
COMMIT;
