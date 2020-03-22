## R file to visualize the results from "2s2p-awp" simulation
## Edward J. Xu
## Jan 3rd, 2020

rm(list = ls())
setwd("~/GitHub/ReservexSim/ReservexSim/2s2p-awp")

library(tidyverse)
library(magrittr)
library(ggplot2)
library(tidyr)
library(gridExtra)

#### Get the Data ####
ll <- 
  nrow(read_csv("./results/mat_p.csv"))

kk <-
  ncol(read_csv("./results/mat_p.csv"))

ti_p <-
  read_csv("./results/mat_p.csv", col_names = as.character(1:kk)) %>%
  mutate(j = 1:nrow(.)) %>%
  gather(- j, key = "n_char", value = "price") %>%
  mutate(k = as.numeric(n_char)) %>%
  select(j, k, price)

ti_q <- 
  read_csv("./results/mat_q.csv", col_names = as.character(1:kk)) %>%
  mutate(j = 1:nrow(.)) %>%
  gather(- j, key = "n_char", value = "quantity") %>%
  mutate(k = as.numeric(n_char)) %>%
  select(j, k, quantity)

ti <- 
  left_join(ti_q, ti_p, by = c("k", "j")) %>%
  gather(-j, -k, key = "whi", value = "value")

#### Visualize the reservation ####

ti %>%
  filter(k == 1) %>%
  ggplot() +
    geom_line(mapping = aes(x = j, y = value, color = whi)) +
    facet_grid(rows = vars(whi)) +
    labs(title = "1-Step Forward Prices and 1-Step Reservation", 
      x = "Time Units", y = "Values")

#### Visualize the generation of forward prices ####

plot_pq <- function(ti){
  p1 <-
    ti %>%
    filter(whi == "price") %>%
    ggplot() +
      geom_tile(aes(x = j, y = k, fill = value)) +
      theme(axis.title.x = element_blank(), axis.text.x = element_blank(),
        axis.ticks.x = element_blank(), legend.position = "none") +
      labs(x = "Step", y = "Target Unit", title = paste("Forward Prices,", 
        "Total Reservations Quantity and Total Loss"))  
  
  p2 <-
    ti %>%
    filter(whi == "quantity") %>%
    ggplot() +
      geom_tile(aes(x = j, y = k, fill = value)) +
      theme(axis.title.x = element_blank(), axis.text.x = element_blank(),
        axis.ticks.x = element_blank(), legend.position = "none") +
      labs(x = "Step", y = "Target Unit")  # title = "Reservations", 
  
  p3 <-
    read_csv("./results/vec_obj.csv", col_names = c("loss")) %>%
    mutate(j = 1:nrow(.)) %>%
    ggplot() +
      geom_line(mapping = aes(x = j, y = loss))
    
  grid.arrange(p1, p2, p3, ncol = 1)
}

plot_pq(ti)

#### Visualize Prosumers' AWPs ####

li_mat_y_all <-
  read_csv("./results/mat_xy_all.csv", 
    col_names = c("u", "l", "x", as.character(1: kk))) %>%
  gather(-u, -l, -x, key = k, value = y)
  
li_mat_y_all %>%
  filter(u == 1 | u == 10 | u == 20 | u == 30) %>%
  ggplot() +
    geom_tile(aes(x = l, y = k, fill = y)) +
    geom_step(aes(x = l, y = x + 1, color = "red")) +
    facet_grid(rows = vars(u)) +
    labs(x = "Time Units", y = "Forward Time Units", title = 
      "Examples of AWPs and Realizations of Prosumers", subtitle = 
      "with strong forward effect of realization switching on AWPs")



