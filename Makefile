TMPL_FILES := $(wildcard *.tmpl)
TARGET_FILES := $(basename $(TMPL_FILES))

all: $(TARGET_FILES)
	@echo "-------------------------------------------------------------------"
	@echo "done."
	@echo "maybe a 'service apache2 reload|graceful|restart' is in order?"
	@echo "or 'a2ensite ...'?"
	@echo "-------------------------------------------------------------------"

$(TARGET_FILES): % : %.tmpl apachesubst.tcl $(wildcard templates/*.tmpl)
	@echo "[+] $< --> $@"
	@./apachesubst.tcl <$< >$@

