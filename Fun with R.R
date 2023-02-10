install.packages('palmerpenguins')
library(palmerpenguins)

install.packages('ggplot2')
library('ggplot2')

ggplot(data = penguins, aes(x=flipper_length_mm,y=body_mass_g)) + geom_point()
#geom_bar or more

#add colors
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + geom_point(color="purple")

#color each species of penguin
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + geom_point(aes(color=species))

#highlight shape with different species
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + geom_point(aes(shape=species))

#Both colors and shapes
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_point(aes(shape=species,color=species))

#crack down to more subsets
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_point(aes(shape=species,color=species)) + facet_wrap(~species)

#title plot
ggplot(data = penguins, 
       aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_point(aes(shape=species,color=species)) + facet_wrap(~species) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length")
