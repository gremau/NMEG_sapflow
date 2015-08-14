# NMEG_sapflow

This is the code for filtering sapflow data from the PJ Control and PJ girdle
(US-Mpj and US-Mpg) sites in the New Mexico Elevation Gradient. 

## Current scripts

A number of iterations of filtering scripts have been developed and used over
the years. Currently useful scripts are:

1. `PJControl_Granier_QAQC.m`
    * For filtering control site
    * Filters Control to end of 2013 data (see note in archive/ section below)
    * Uses input file: "Input_PJc_continuo_todo_csv.csv"
2. `PJGirdle_Granier_QAQC.m`
    * For filtering Girdle site
    * Filters only mid 2013 to end of 2013 data
    * Uses input file: "Input_PJg_continuo_todo_timecol.csv"
3. `get_af_data.m`
    * A function for fetching met data from Ameriflux files.
4. Everything in figure_scripts/
    * There are scripts in here that make ~14 different plots

There are also a few  scripts (litvak_day, Litvak_timestamp) that may be useful,
but I am not sure how yet.

## How to use these

1. Assemble the input files in a location accessible from where you are running the QAQC scripts (either PJControl_Granier_QAQC.m or PJGirdle_Granier_QAQC.m).

2. Assemble the necessary Ameriflux files in a location accessible from where you are running the QAQC scripts.

3. Edit the paths at the start of the QAQC script with the location of input
   data (above) and the path you want to output data to.

4. Run the QA/QC scripts.

## archive/

In here you will find the old code - it was useful for creating the newer files,
and they may be useful again soon. Don't discard these yet!

__Note__ that the sensor removal periods in `Litvak_PJ_Control_Granier_QA_QC_Laura.m` and `Litvak_PJ_Control_Granier_QA_QC_DK1.m` were different when the new QAQC script for PJ Control was made.

    * `Litvak_PJ_Control_Granier_QA_QC_Laura.m` filtered 2008 to mid 2013 data
    * `Litvak_PJ_Control_Granier_QA_QC_DK1.m` filtered from mid 2013 forward
