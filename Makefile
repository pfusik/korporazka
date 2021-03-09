run: korporaz.xex korporac.xex korpora2.xex korporc2.xex
	start $<

korporaz.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=0 $<

korporac.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=1 $<

korporaz.zip: korporaz.xex korporac.xex korporaz.txt
	7z a -mx=9 -bd -bso0 -tzip $@ $^

korpora2.xex: korpora2.asx
	xasm -o $@ -D COMPATIBLE=0 $<

korporc2.xex: korpora2.asx
	xasm -o $@ -D COMPATIBLE=1 $<

korpora2.zip: korpora2.xex korporc2.xex korpora2.txt
	7z a -mx=9 -bd -bso0 -tzip $@ $^

clean:
	$(RM) korporaz.xex korporac.xex korpora2.xex korporc2.xex korporaz.zip korpora2.zip
