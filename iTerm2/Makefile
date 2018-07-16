#.PHONY= install

PROFILE = soblom.json
PRO_TARGET =~/Library/Application\\\ Support/iTerm2/DynamicProfiles/$(PROFILE)
BASECONF = com.googlecode.iterm2.plist
BASE_TARGET =~/Library/Preferences/$(BASECONF)

# Not sure why, but this stops make from wanting to update the profile
# sblom.json: ;

install: $(PRO_TARGET) $(BASE_TARGET)

$(PRO_TARGET): $(PROFILE)
	cp $^ $@

$(BASE_TARGET): $(BASECONF)
	defaults delete com.googlecode.iterm2 
	defaults import com.googlecode.iterm2 $(notdir $(baseconf))
