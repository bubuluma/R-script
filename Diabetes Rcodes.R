library(readxl)
diabetes_dataset_2_ <- read_excel("C:/Users/rotondwa/Downloads/diabetes_dataset (2).xlsx")
View(diabetes_dataset_2_)
summary(diabetes_dataset_2_)
library(tidyverse)
attach(diabetes_dataset_2_)

diabetes_dataset_2_ |> 
  ggplot(aes(x = Pregnancies)) +
  geom_bar()

plot1 <- diabetes_dataset_2_ |> 
  ggplot(aes(x = Pregnancies,
             fill = Outcome)) + 
  geom_bar()

plot1

plot2 <- diabetes_dataset_2_ |> 
  ggplot(aes(x = Pregnancies,
             fill = Outcome)) +
  geom_bar(position = position_dodge())

plot2 


plot3 <- diabetes_dataset_2_ |> 
  ggplot(aes(x = Pregnancies,
             fill = Outcome)) +
  geom_bar(show.legend = FALSE) +
  facet_wrap( ~ Outcome) 

plot3

# To create a basic boxplot of the two varibales: Outcome and Age

diabetes_dataset_2_ |> 
  ggplot(aes(x = Outcome,
             y = Age)) +
  geom_boxplot()

diabetes_dataset_2_ |> 
  ggplot(aes(x = Outcome,
             y = Age,
             fill = BMIcategories)) + 
  geom_boxplot()

# Using facet_wrap() function to create sub plots of the factors (Normal, Obese, Overweight, Underweight) of the BMIcategories variable
diabetes_dataset_2_ |>  
  ggplot(aes(x = Outcome,
             y = Age,
             fill = BMIcategories)) +
  geom_boxplot(show.legend = F) + 
  facet_wrap(~ BMIcategories)

diabetes_dataset_2_ |> 
  ggplot(aes(x = Outcome,
             y = Age,
             fill = Outcome)) + 
  geom_boxplot(show.legend = FALSE)

# Boxplot: same plot as above, but use the function geom_jitter() to add participant data points
diabetes_dataset_2_ |> 
  ggplot(aes(x = Outcome,
             y = Age,
             fill = Outcome)) +
  geom_boxplot(show.legend = FALSE) + 
  geom_jitter()

# BMIcategories + Glucose + Outcome
diabetes_dataset_2_ |> 
  ggplot(aes(x = BMIcategories,
             y = Glucose,
             fill = Outcome)) +
  ggtitle("Distribution of Glucose stratified by BMI categories and Outcome") +
  geom_boxplot()

diabetes_dataset_2_ |> 
  ggplot(aes(x = BMIcategories,
             y = Insulin,
             fill = Outcome)) +
  geom_boxplot() +
  ggtitle("Distribution of Insulin stratified by BMI categories and Outcome") +
  theme_classic()

# Age and Insulin and Outcome Scatter plots
diabetes_dataset_2_ |> 
  ggplot(aes(x = Age,
             y = Insulin,
             colour = Outcome)) + 
  geom_point()

diabetes_dataset_2_ |> 
  ggplot(aes(x = Age,
             y = Insulin,
             colour = Outcome)) +
  geom_point() +
  facet_wrap(~ Outcome)
