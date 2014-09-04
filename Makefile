TMPL_FILES := $(wildcard *.tmpl)
## comment out to omit suffix. this value should match the suffix defined in a2ensite
SUFFIX=.conf
TARGET_FILES := $(addsuffix $(SUFFIX),$(basename $(TMPL_FILES)))

all: $(TARGET_FILES)
	@echo "-------------------------------------------------------------------"
	@echo "done."
	@echo "maybe a 'service apache2 reload|graceful|restart' is in order?"
	@echo "or 'a2ensite ...'?"
	@echo "-------------------------------------------------------------------"

$(TARGET_FILES): %$(SUFFIX) : %.tmpl apachesubst.tcl $(wildcard templates/*.tmpl)
	@echo "[+] $< --> $@"
	@./apachesubst.tcl <$< >$@
