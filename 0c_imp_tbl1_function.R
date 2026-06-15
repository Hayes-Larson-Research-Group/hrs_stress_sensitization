# Purpose: Mean and SD across imputations for table 1
### Note: this is code that Juliet and Eleanor developed in the KHANDLE ACEs paper!
# Author: Taylor M. Mobley
# Date: April 17, 2025

imp_cts_var_tbl1 <- function(df, cts_vars, grp, digits = 1) {
  
  ## TMM commenting out things that I don't need. I don't stratify T1 by anything, 
  ## for example, so I don't need the grpout object
  #
  # df <- dat_tab1_cogsamp_imp
  # # cts_vars is a vector of variables to summarize
  # cts_vars <- contvars
  # # grp is a vector of variables to stratify by
  # grp <- "ACE_fac1_z_gtmedian"
  # digits <- 1
  #
  # extract labels 
  # labels <- var_label(df) %>% 
  #   bind_rows() %>% t() %>% 
  #   as_tibble(rownames = "variable") %>% 
  #   setNames(c("variable", "label")) %>% 
  #   filter(variable %in% c(cts_vars, grp))
  #
  # grpout <- df %>% 
  #   group_by(across(all_of(grp))) %>% 
  #   group_keys()
  
  overallout <- tibble("Overall")
  # colnames(overallout) <- grp
  
  for (var in cts_vars) {
    #var<-"W1_INTERVIEW_AGE"
    temp <- df %>% 
      group_by(imp) %>% 
      summarise(mean_imp = mean(get(var)), var_imp = var(get(var))) %>% 
      ungroup() %>% 
      summarise(mean = mean(mean_imp), 
                sd = mean(var_imp) %>% sqrt()) %>% 
      mutate(out = paste0(format(round(mean, digits), nsmall = digits), 
                          " (", format(round(sd, digits), nsmall = digits), ")"))
    
    overallout[var] <- temp$out
    
    ## TMM commenting out stratified results 
    # temp <- df %>% 
    #   group_by(across(all_of(c(".imp", grp)))) %>% 
    #   summarise(mean_imp = mean(get(var)), var_imp = var(get(var))) %>% 
    #   ungroup() %>% 
    #   group_by(across(all_of(grp))) %>% 
    #   summarise(mean = mean(mean_imp), 
    #             sd = mean(var_imp) %>% sqrt()) %>% 
    #   ungroup() %>% 
    #   mutate(out = paste0(format(round(mean, digits), nsmall = digits), 
    #                       " (", format(round(sd, digits), nsmall = digits), ")"))
    # grpout[var] <- temp$out
  }
  
  ## TMM commenting out code that binds marginal and stratified results
  # rbind(grpout, overallout) %>% 
  #   t() %>% as_tibble(rownames = "variable") %>% 
    # left_join(labels, by = "variable") %>% 
    # select(label, V1, V2, V3) %>% 
  
  overallout %>% t() %>% as_tibble(rownames = "variable") %>% 
    return()
}
