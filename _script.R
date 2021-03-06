#- Esto es lo q yo uso para crear mis packages --------------------------------------------
#------------------------------------------------------------------------------------------
# You can learn more about package authoring with RStudio at:  http://r-pkgs.had.co.nz/
# NO-NO-NO lo voy a gestionar con packrat: https://rstudio.github.io/packrat/?version=1.1.456&mode=desktop
# GIT para RStudio: https://support.rstudio.com/hc/en-us/articles/200532077?version=1.1.456&mode=desktop
#
# Some useful keyboard shortcuts for package authoring:
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#------------------------------------------------------------------------------------------
#1) En RStudio: File >> New Project >>New Directory >> R pkg (he puesto que SÍ a git y packrat)
#2) Borro ./R/hello.R y ./man/hello.Rd

library(usethis)
#---------------- has de elegir un nombre para el pkg
name_of_the_pkg <- "pjp.funs"
# path <- paste0("C:/Users/perezp/Desktop/a_GIT_2016a/", name_of_the_pkg)
# usethis::create_package(path, rstudio = TRUE)

#------------------------
use_roxygen_md()  #- sets up roxygen2 and enables markdown mode so you can use markdown in your roxygen2 comment blocks.
use_package_doc() #- creates un archivo en ./R/  es a skeleton documentation file for the complete package, taking the advantage of the latest roxygen2 features to minimise duplication between the DESCRIPTION and the documentation
use_readme_rmd()  #- creates a README.Rmd: use this to describe what your package does and why people should care about it.
use_news_md()     #- creates a basic NEWS.md for you to record changes
use_mit_license(name = "Pedro J. Pérez")

#-----------------------en el fichero: DESCRIPTION
#- Modifico las siguientes lineas:
# Title: Provides some Spanish Boundary data (shapes) as 'sf'-Ready Data Frames
# Description:  Provides Spanish Boundary data (shapes) as 'sf'-Ready Data Frames. Boundary Data comes from
# Authors@R: person("Pedro J.", "Perez", , "pedro.j.perez@uv.es", c("aut", "cre"))
# Maintainer: Pedro J. Perez <pjperez@uv.es>


#----------------  Vignette
my_name_vignette <- paste0("intro-to-", name_of_the_pkg)
use_vignette(my_name_vignette) #- sets you up for success by configuring DESCRIPTION and creating a .Rmd template in vignettes/
#- Has de poner en el yaml de la vignette
# title: "Intro to spanishRshapes package"
# author: "Pedro J. Pérez"
# %\VignetteIndexEntry{Intro to spanishRshapes package}


#----------------------
devtools::use_data_raw()  #- crea directorio de raw-data

#----------------------
use_build_ignore("_script.R")



#--------------------------- GIT
use_git(message = "Primer commit")           #- activa GIT. se reinicia RStudio, asi q has de volver a hacer library(usethis)


use_github()  #- si que me ha funcionado (tuve q instalar git2r)

#---------------------------- GITHUB
library(usethis)
use_github_labels()  #- labelling issues
use_github_links()   #- añade links en la file DESCRIPTION



# git remote add origin https://github.com/perezp44/pjp.funs.git


#--------------------- te vas a TERMINAL y haces
# git remote add origin https://github.com/perezp44/pjp.funs.git  (En realidad esto ya esta hecho)
# git add -A
# git commit --all --message "todo a Github"
# git push -u origin master
#

#--------------------------- Ahora ya toca meter datos y arreglar documentación
#--------------------------- Ahora ya toca meter datos y arreglar documentación


#--------------------  README
#------ has de knittear README.Rmd para que aparezca README.md q es la que se muestra en Github por defecto


#--------------------- LA VIGNETTE
use_build_ignore("./vignettes/info_vignettes.txt")


#----------- FICHEROS de datos
#- si quieres poner algun fichero con datos tienes que "crear" el fichero de datos y hacer:

library(usethis)
# use_data(capitales_prov) #- lo guarde con esta linea que usa el pkg usethis el 2018-02-09
# luego lo has de documentar ...
# Para docuementar los datos del pkg lo que hado es crear un fichero data_el_df.R y lo meto dentro de la carpeta ./R/  (mira algún ejemplo)



#------------------------------------------------------
#------------------------------------------------------ PARA DESPUES CORRERLO
#------------------------------------------------------


devtools::build_vignettes()  #- viñetas

devtools::check(cran = FALSE)            #- chequea
devtools::check()           #- chequea


devtools::document()   #- procesa los roxygen comments y las vignettes



devtools::build()



#-  METER FUNCIONES en el pkg -------------------------------------------------------------
#


#------------------------------ USAR el pkg

# devtools::install_github("perezp44/spanishRshapes")
library(spanishRshapes)
library(tidyverse)

aa <- ls("package:spanishRshapes", all = TRUE) %>% as.data.frame()#- ves lo que hay en mypkgDataforblog
help(package = spanishRshapes)
bb <- IGN_mun_17s
names(bb)
cc <- bb %>% filter(NombreMuni  == "Pancrudo")
bb[bb$NombreCCAA=="Galicia",]

#--------------------   Github
# git remote add origin https://github.com/perezp44/mypkgfordata.git
# cd c:/Users/perezp/Desktop/a_GIT_2016a/mypkgDataforblog
# git add -A    # stages all files
# git commit --all --message "Creando el REPO"
# git push -u origin master


#----------------- Licencia
# En esta pagina pone esto de licencia
# http://opendata.esri.es/datasets/d8854f26fd5c4baab08337ca0f3aff6f_0#
#Licencia (compatible con CC-BY 4.0) ampara el uso libre y gratuito para cualquier propósito legítimo,
#siendo la única estricta obligación la de reconocer y mencionar el origen y propiedad de los productos
#y servicios de información geográfica licenciados como del IGN según se indica en la licencia.
#Créditos: © Instituto Geográfico Nacional



#------- BADGES
install.packages("badgecreatr")
badgecreatr::badgeplacer( githubaccount = "perezp44",githubrepo = "spanishRshapes", branch = "master")
badgecreatr::badgeplacer(location = ".", status = "wip" , githubaccount = "perezp44",githubrepo = "spanishRshapes", branch = "master")




#------- PKGDOWN
devtools::install_github("hadley/pkgdown")
pkgdown::build_site()
