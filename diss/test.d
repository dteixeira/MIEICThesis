# vim: ft=make
.PHONY: test._graphics
test.aux test.aux.make test.d test.pdf: $(call path-norm,test.tex)
.SECONDEXPANSION:
