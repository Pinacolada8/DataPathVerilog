view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/DataPath/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 5000ps sim:/DataPath/rst 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 20ps Edit:/DataPath/rst 
WaveCollapseAll -1
wave clipboard restore
