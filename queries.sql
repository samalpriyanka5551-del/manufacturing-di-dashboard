-- Top 5 Defective Machines (Window Function + CTE)
WITH defect_summary AS (
  SELECT machine_id, SUM(defects) as total_defects 
  FROM production_logs GROUP BY machine_id
)
SELECT m.machine_name, d.total_defects, 
RANK() OVER (ORDER BY d.total_defects DESC) as defect_rank 
FROM defect_summary d 
JOIN machines m ON d.machine_id = m.machine_id 
ORDER BY total_defects DESC LIMIT 5;

-- Daily Production Trend
SELECT DATE(timestamp) as prod_date, SUM(units_produced) as total_units
FROM production_logs GROUP BY prod_date ORDER BY prod_date;

-- Machine Efficiency
SELECT machine_id, 
AVG(efficiency) as avg_efficiency,
MIN(efficiency) as min_eff
FROM production_logs GROUP BY machine_id;
