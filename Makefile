run: korpora2.xex korporaz.xex korporac.xex
	start $<

korpora2.xex: korpora2.asx
	xasm -o $@ -D COMPATIBLE=0 $<

korporaz.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=0 $<

korporac.xex: korporaz.asx
	xasm -o $@ -D COMPATIBLE=1 $<

korporaz.zip: korporaz.xex korporac.xex korporaz.txt
	7z a -mx=9 -bd -bso0 -tzip $@ $^

clean:
	$(RM) korporaz.xex korporac.xex korporaz.zip
