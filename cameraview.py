# -*- coding: utf-8 -*-
import cv2

print(cv2.getBuildInformation())
# カメラのキャプチャを開始 --- (*1)
#cam = cv2.VideoCapture('udpsrc port=8552 ! application/x-rtp, media=(string)video, encoding-name=(string)RAW, sampling=(string)BGR, depth=(string)8, width=(string)640, height=(string)480 ! rtpvrawdepay ! queue ! videoconvert ! videorate ! video/x-raw, framerate=(fraction)15/1 ! appsink sync=false')
#cam = cv2.VideoCapture('udpsrc port=8552 ! application/x-rtp, media=(string)video, encoding-name=(string)RAW, sampling=(string)YCbCr-4:2:0, depth=(string)8, width=(string)640, height=(string)480 ! rtpvrawdepay ! queue ! videoconvert ! videorate ! video/x-raw, framerate=(fraction)15/1 ! appsink sync=false')
#cam = cv2.VideoCapture(0)
#cam = cv2.VideoCapture('videotestsrc ! videoconvert ! appsink', cv2.CAP_GSTREAMER)
cam = cv2.VideoCapture('filesrc location=768x576.avi ! decodebin ! videoconvert ! appsink')

if cam.isOpened():
	print('failed to open!!')
	exit(0)

width  = int(cam.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cam.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps    = cam.get(cv2.CAP_PROP_FPS)

print('width:%d height:%d fps:%f' % (width, height, fps))

while True:
	# 画像を取得 --- (*2)
	_, img = cam.read()
	# ウィンドウに画像を表示 --- (*3)

	cv2.line(img, ( 0, int(height/2) ), (width, int(height/2)), (0, 0, 255), 1)
	cv2.line(img, ( int(width*1/5), 0), (int(width*1/5), height), (0, 0, 255), 1)
	cv2.line(img, ( int(width*2/4), 0), (int(width*2/4), height), (0, 0, 255), 1)
	cv2.line(img, ( int(width*4/5), 0), (int(width*4/5), height), (0, 0, 255), 1)



	cv2.imshow('cap', img)
	# Enterキーが押されたら終了する
	if cv2.waitKey(1) & 0xFF == 27:
		break
# 後始末
cam.release()
cv2.destroyAllWindows() 