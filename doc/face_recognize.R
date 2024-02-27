## Data Science and Public Policy
## Are facial recognition algorithms biased?
##--##--##--##--##--##--##--##--##--##--##--##

## The packages below provide tools for analyzing image data in R
## libfacedetection was developed by Professor Shiqi Yu (https://github.com/ShiqiYu)
## It's a CNN that was trained to detect faces in images.
## For more information, see: https://github.com/ShiqiYu/libfacedetection

## The FairFace dataset is described here: https://arxiv.org/pdf/1908.04913.pdf
## It's one of the first datasets of faces that is balanced along racial categories

## Your goal: examine whether facial recognition algorithms are biased, as Joy Buolamwini  
## argues in the readings for week 11

## Option 1: 
## Use the CNN that Professor Yu developed to examine whether its ability to detect faces 
## varies by the demographic characteristics of the person (race, gender, age)

## Option 2:
## Train your own CNN to detect faces using the FairFace dataset and evaluate whether your 
## model's performance varies by the demographic characteristics of the person

## Below is some code that can get you started with option 1:

setwd("<path to your working directory here>")

library(magick)
library(image.libfacedetection)

# Demographic characteristics of pepople in the images:
fairface_label_train = read.csv("fairface_label_train.csv")
fairface_label_val = read.csv("fairface_label_val.csv")

# Paths to image files:
train_images = list.files("train/")
val_images = list.files("val/")

# The function image_read() reads the image into memory (you can run a loop to load all images):
example_image = image_read(paste0("train/",train_images[sample(1:length(train_images),1)]))

# The function image_detect_faces() uses Yu's model to detect faces in an image
# Note that if thre model returns no data, it means that it did not detect a face:
example_image_faces = image_detect_faces(example_image)

# The "confidence" variable is a confidence score for the detection (ranges from 0-100)
# You can use it as your main measure for how well the model detected a face
example_image_faces$detections$confidence

# You can also visualize with this code:
plot(example_image_faces, example_image, border = "green", lwd = 5, col = "white")
