-- 1.1 住所録テーブルの作成
CREATE TABLE Jyushoroku
(
  toroku_bango INTEGER NOT NULL,
  namae VARCHAR(128) NOT NULL,
  jyusho VARCHAR(128) NOT NULL,
  tel_no CHAR(10),
  mail_address CHAR(20),
    PRIMARY KEY (toroku_bango)
);

-- 1.2 カラムの追加
ALTER TABLE Jyushoroku ADD COLUMN yubin_bango CHAR(8) NOT NULL;

-- 1.3 テーブル削除
DROP TABLE Jyushoroku;

-- 1.4 テーブル復活

