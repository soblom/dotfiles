.PHONY= install

profile = ~/Library/Application\\\ Support/iTerm2/DynamicProfiles/soblom.json
baseconf = ~/Library/Preferences/com.googlecode.iterm2.plist

# Not sure why, but this stops make from wanting to update the profile
sblom.json: ;

$(profile): soblom.json
	cp $^ $@ 

$(baseconf): $(profile)
	defaults delete com.googlecode.iterm2 
	defaults import com.googlecode.iterm2 $(notdir $(baseconf))

install: $(profile) $(baseconf)
