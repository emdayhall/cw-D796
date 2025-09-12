#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/10/2025
# Course: D796
# download stuff to delete
############


uri1="https://media.gq-magazine.co.uk/photos/64b53face8d9da00d5512124/16:9/w_2560%2Cc_limit/Best-Ainme-Films-hp.jpg"
uri2="https://resizing.flixster.com/yqTAtkjptg60RVQTJ4t6NSW5WxI=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzdlNjFmMmU4LTg1NmMtNDc3Ni1iZDljLWNlY2VhZDQ3ODI0Yi53ZWJw"
uri3="https://imgix.ranker.com/list_img_v2/16669/3216669/original/3216669-u1"
uri4="https://www.vice.com/wp-content/uploads/sites/2/2022/07/1658893729691-gallery-6.jpeg"
uri5="https://cdn.theatlantic.com/thumbor/ivQgFYHzm7KNvBzNWr6DixsxHyw=/0x0:1023x575/960x540/media/img/mt/2020/01/weathering/original.jpg"

uri6="https://static0.gamerantimages.com/wordpress/wp-content/uploads/2024/12/mixcollage-12-dec-2024-03-39-pm-2098.jpg"

uri7="https://www.whats-on-netflix.com/wp-content/uploads/2024/03/my-oni-girl-japanese-anime-movie-coming-to-netflix-in-may-2024-jpg.webp"

declare -a pics=( $uri1 $uri2 $uri3 $uri4 $uri5 $uri6 $uri7)

floc1="/Users/emhall/test/a"
floc2="/Users/emhall/test/b"
floc3="/Users/emhall/test/c"
l=0
for i in "${pics[@]}"; do
	echo $1
	l=$(($l+1))
	curl $i --output $floc1/$l.jpg
	curl $i --output $floc2/$l.jpg
	curl $i --output $floc3/$l.jpg
done