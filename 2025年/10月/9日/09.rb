### 学んだSQL
SELECT DISTINCT title FROM titles;
## → 重複を除いて役職一覧を取得（DISTINCTでユニーク化）

SELECT title
FROM titles
WHERE emp_no = 49988
ORDER BY from_date ASC
LIMIT 1;
##  → 特定従業員の「最初の役職」を抽出。
##   （ORDER BY from_dateで時系列昇順、LIMIT 1で最初のレコード）

SELECT salary
FROM salaries
WHERE emp_no = 40000
AND EXTRACT(YEAR FROM from_date) = 1996
AND EXTRACT(YEAR FROM to_date) = 1997; 
##→ 特定年度の給与データ抽出。

