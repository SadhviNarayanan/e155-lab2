-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/sanarayanan/my_designs/lab1_seven_seg/source/impl_1/lab1_sn.sv" 
"C:/Users/sanarayanan/my_designs/lab1_seven_seg/source/impl_1/seven_segment.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_sn
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
