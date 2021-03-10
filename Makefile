run: korporaz.xex korporac.xex ditherci.xex dithercc.xex
	start $<

korporaz.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=0 $<

korporac.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=1 $<

korporaz.zip: korporaz.xex korporac.xex korporaz.txt korporaz.png
	7z a -mx=9 -bd -bso0 -tzip $@ $^

ditherci.xex: ditherci.asx
	xasm -o $@ -D COMPATIBLE=0 $<

dithercc.xex: ditherci.asx
	xasm -o $@ -D COMPATIBLE=1 $<

ditherci.zip: ditherci.xex dithercc.xex ditherci.txt ditherci.png
	7z a -mx=9 -bd -bso0 -tzip $@ $^

dist: korporaz.zip ditherci.zip

clean:
	$(RM) korporaz.xex korporac.xex korporaz.zip ditherci.xex dithercc.xex ditherci.zip
