Q1
mysql> CREATE TABLE `departments` (
    ->     `department_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    ->     `name` VARCHAR(20) NOT NULL,
    ->     `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ->     `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ->     PRIMARY KEY (`department_id`)
    -> );
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> SHOW TABLE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SHOW TABLES ;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| departments         |
| reports             |
| users               |
+---------------------+
3 rows in set (0.00 sec)

mysql> RENAME TABLE users TO people;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW TABLES ;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| departments         |
| people              |
| reports             |
+---------------------+
3 rows in set (0.00 sec)

Q2
mysql>  ALTER TABLE people ADD department_id INT unsigned AFTER email;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC people;
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type             | Null | Key | Default           | Extra                                         |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id     | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)      | NO   |     | NULL              |                                               |
| email         | varchar(255)     | YES  | UNI | NULL              |                                               |
| department_id | int unsigned     | YES  |     | NULL              |                                               |
| age           | tinyint unsigned | YES  |     | NULL              |                                               |
| gender        | tinyint          | YES  |     | NULL              |                                               |
| created_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
8 rows in set (0.01 sec)

Q3
mysql> INSERT INTO departments (name)
    -> VALUES 
    ->     ('営業'),
    ->     ('開発'),
    ->     ('経理'),
    ->     ('人事'),
    ->     ('情報システム');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM departments;
+---------------+--------------------+---------------------+---------------------+
| department_id | name               | created_at          | updated_at          |
+---------------+--------------------+---------------------+---------------------+
|             1 | 営業               | 2025-04-09 20:34:37 | 2025-04-09 20:34:37 |
|             2 | 開発               | 2025-04-09 20:34:37 | 2025-04-09 20:34:37 |
|             3 | 経理               | 2025-04-09 20:34:37 | 2025-04-09 20:34:37 |
|             4 | 人事               | 2025-04-09 20:34:37 | 2025-04-09 20:34:37 |
|             5 | 情報システム       | 2025-04-09 20:34:37 | 2025-04-09 20:34:37 |
+---------------+--------------------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO people (name, department_id) VALUES
    -> ('岩本 照', 1),
    -> ('深澤 辰哉', 1),
    -> ('宮舘 涼太', 1),
    -> ('ラウール', 2),
    -> ('向井 康二', 2),
    -> ('目黒 蓮', 2),
    -> ('佐久間  大介', 2),
    -> ('阿部 亮平', 3),
    -> ('ジェシー', 4),
    -> ('渡辺翔太', 5);
Query OK, 10 rows affected (0.04 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |          NULL |   20 |      1 | 2025-03-26 20:32:57 | 2025-03-26 20:32:57 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2025-03-26 20:35:21 | 2025-03-26 20:35:21 |
|         3 | 福田だいすけ          | fukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2025-03-26 20:35:21 | 2025-03-26 20:35:21 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2025-03-26 20:35:21 | 2025-03-26 20:35:21 |
|         6 | 不思議沢みちこ        | NULL                         |          NULL | NULL |   NULL | 2025-03-26 20:35:21 | 2025-03-26 20:35:21 |
|         7 | 岩本 照               | NULL                         |             1 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|         8 | 深澤 辰哉             | NULL                         |             1 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|         9 | 宮舘 涼太             | NULL                         |             1 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        10 | ラウール              | NULL                         |             2 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        11 | 向井 康二             | NULL                         |             2 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        12 | 目黒 蓮               | NULL                         |             2 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        13 | 佐久間 大介           | NULL                         |             2 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        14 | 阿部 亮平             | NULL                         |             3 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        15 | ジェシー              | NULL                         |             4 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
|        16 | 渡辺翔太              | NULL                         |             5 | NULL |   NULL | 2025-04-10 19:38:10 | 2025-04-10 19:38:10 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.01 sec)


mysql> INSERT INTO reports (person_id, content) VALUES
    -> (1, '今日は営業先で3件の打ち合わせを行いました。'),
    -> (2, '新しい機能の仕様をチームで確認しました。'),
    -> (3, 'クライアントからの要望対応に追われました。'),
    -> (4, '設計書のレビューと修正を行いました。'),
    -> (6, '資料作成とメール対応で半日が終わった。'),
    -> (7, 'チームのコードレビューをしました。'),
    -> (8, '営業資料を改善しプレゼン練習を行いました。'),
    -> (9, '定例ミーティングで週次報告を実施しました。'),
    -> (10, 'サーバーログの確認と調整を行いました。');
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO reports (person_id, content) VALUES
    -> (11, '新入社員のサポートを行いました。');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT r.report_id, p.name, r.content, r.created_at
    -> FROM reports r
    -> JOIN people p ON r.person_id = p.person_id;
+-----------+-----------------------+------------------------------------------------------------------+---------------------+
| report_id | name                  | content                                                          | created_at          |
+-----------+-----------------------+------------------------------------------------------------------+---------------------+
|         1 | 鈴木たかし            | 今日は営業先で3件の打ち合わせを行いました。                      | 2025-04-11 19:17:47 |
|         2 | 田中ゆうこ            | 新しい機能の仕様をチームで確認しました。                         | 2025-04-11 19:17:47 |
|         3 | 福田だいすけ          | クライアントからの要望対応に追われました。                       | 2025-04-11 19:17:47 |
|         4 | 豊島はなこ            | 設計書のレビューと修正を行いました。                             | 2025-04-11 19:17:47 |
|         5 | 不思議沢みちこ        | 資料作成とメール対応で半日が終わった。                           | 2025-04-11 19:17:47 |
|         6 | 岩本 照               | チームのコードレビューをしました。                               | 2025-04-11 19:17:47 |
|         7 | 深澤 辰哉             | 営業資料を改善しプレゼン練習を行いました。                       | 2025-04-11 19:17:47 |
|         8 | 宮舘 涼太             | 定例ミーティングで週次報告を実施しました。                       | 2025-04-11 19:17:47 |
|         9 | ラウール              | サーバーログの確認と調整を行いました。                           | 2025-04-11 19:17:47 |
|        10 | 向井 康二             | 新入社員のサポートを行いました。                                 | 2025-04-11 19:18:47 |
+-----------+-----------------------+------------------------------------------------------------------+---------------------+
10 rows in set (0.01 sec)

mysql> SELECT * FROM reports WHERE person_id = 5;　（person_idの5に紐づく日報はない結果）
Empty set (0.00 sec)


Q4
mysql> UPDATE people SET department_id = 1 WHERE person_id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 1 WHERE person_id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 2 WHERE person_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 3 WHERE person_id = 4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 4 WHERE person_id = 6;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT p.person_id, p.name, d.name AS department_name
    -> FROM people p
    -> JOIN departments d ON p.department_id = d.department_id
    -> WHERE p.person_id BETWEEN 1 AND 6;
+-----------+-----------------------+-----------------+
| person_id | name                  | department_name |
+-----------+-----------------------+-----------------+
|         1 | 鈴木たかし            | 営業            |
|         2 | 田中ゆうこ            | 営業            |
|         3 | 福田だいすけ          | 開発            |
|         4 | 豊島はなこ            | 経理            |
|         6 | 不思議沢みちこ        | 人事            |
+-----------+-----------------------+-----------------+
5 rows in set (0.00 sec)


Q5
mysql> SELECT name, age
    -> FROM people
    -> WHERE gender = '1'
    -> ORDER BY age DESC;
+--------------------+------+
| name               | age  |
+--------------------+------+
| 福田だいすけ       |   42 |
| 鈴木たかし         |   20 |
+--------------------+------+
2 rows in set (0.00 sec)


Q6
people テーブルの中から、
department_id カラムの値が 1 のレコードだけを対象にし
その中の name、email、age というカラムを取り出し、
created_at カラムの値の昇順に並べて表示する。


Q7

mysql> SELECT name FROM people WHERE(gender = 2 AND age BETWEEN 20 AND 29) OR (gender = 1 AND age BETWEEN 40 AND 49);
+--------------------+
| name               |
+--------------------+
| 田中ゆうこ         |
| 福田だいすけ       |
+--------------------+
2 rows in set (0.00 sec)


Q8

mysql> SELECT name, age
    -> FROM people WHERE department_id = (SELECT department_id FROM departments WHERE name = '営業')
    -> ORDER BY age ASC;
+-----------------+------+
| name            | age  |
+-----------------+------+
| 岩本 照         | NULL |
| 深澤 辰哉       | NULL |
| 宮舘 涼太       | NULL |
| 鈴木たかし      |   20 |
| 田中ゆうこ      |   25 |
+-----------------+------+
5 rows in set (0.00 sec)


Q9

mysql> SELECT AVG(age) AS average_age FROM people WHERE gender = '2'
    -> AND department_id = (SELECT department_id FROM departments WHERE name = '開発' );
+-------------+
| average_age |
+-------------+
|        NULL |
+-------------+
1 row in set (0.00 sec)


Q10

mysql> SELECT p.name,d.name AS department_name,
    -> r.content FROM people p
    -> JOIN departments d ON p.department_id = d.department_id
    -> JOIN reports r ON p.person_id = r.person_id;
+-----------------------+-----------------+------------------------------------------------------------------+
| name                  | department_name | content                                                          |
+-----------------------+-----------------+------------------------------------------------------------------+
| 鈴木たかし            | 営業            | 今日は営業先で3件の打ち合わせを行いました。                      |
| 田中ゆうこ            | 営業            | 新しい機能の仕様をチームで確認しました。                         |
| 福田だいすけ          | 開発            | クライアントからの要望対応に追われました。                       |
| 豊島はなこ            | 経理            | 設計書のレビューと修正を行いました。                             |
| 不思議沢みちこ        | 人事            | 資料作成とメール対応で半日が終わった。                           |
| 岩本 照               | 営業            | チームのコードレビューをしました。                               |
| 深澤 辰哉             | 営業            | 営業資料を改善しプレゼン練習を行いました。                       |
| 宮舘 涼太             | 営業            | 定例ミーティングで週次報告を実施しました。                       |
| ラウール              | 開発            | サーバーログの確認と調整を行いました。                           |
| 向井 康二             | 開発            | 新入社員のサポートを行いました。                                 |
+-----------------------+-----------------+------------------------------------------------------------------+
10 rows in set (0.04 sec)


Q11

mysql> SELECT p.name FROM people p
    -> LEFT JOIN reports r ON p.person_id = r.person_id
    -> WHERE r.report_id IS NULL;
+------------------+
| name             |
+------------------+
| 目黒 蓮          |
| 佐久間 大介      |
| 阿部 亮平        |
| ジェシー         |
| 渡辺翔太         |
+------------------+
5 rows in set (0.01 sec)

Q12
