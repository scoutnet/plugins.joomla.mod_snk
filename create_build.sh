#!/bin/zsh

# mod_snk
version=$(cat module/mod_snk.xml| grep -i "<Version>" | cut -f 2 -d ">" | cut -f 1 -d "<")

if [ ! -e build ]; then
	mkdir build
fi

if [ ! -e build/mod_snk-$version-final.zip ]; then
	svn export module export
	cd export
	zip -r mod_snk-$version-final.zip *
	mv mod_snk-$version-final.zip ../build/
	cd ..
	rm -rf export

	svn add build/mod_snk-$version-final.zip

xml=$(cat build/mod_snk_update.xml | grep -v "</updates>")

echo $xml > build/mod_snk_update.xml

for joomla_version in '1.6' '1.7' '2.5'; do
for client_id in '' '<client_id>1</client_id>'; do

xml="	<update>
		<name>ScoutNet Kalender</name>
		<description>official ScoutNet Kalender</description>
		<element>mod_snk</element>
		<type>module</type>
		<version>$version</version>
		$client_id

		<infourl title=\"ScoutNet URL\">http://www.scoutnet.de</infourl>
		<downloads>
			<downloadurl type=\"full\" format=\"zip\">https://www.scoutnet.de/technik/kalender/plugins/joomla/mod_snk-$version-final.zip</downloadurl>
		</downloads>
		<tags>
			<tag>ScoutNet</tag>
			<tag>Muetze</tag>
		</tags>

		<maintainer>ScoutNet (Mütze)</maintainer>
		<maintainerurl>http://www.scoutnet.de</maintainerurl>
		<section>ScoutNet Kalender</section>

		<targetplatform name=\"joomla\" version=\"$joomla_version\" />
	</update>"

echo $xml >> build/mod_snk_update.xml
done
done

echo "</updates>" >> build/mod_snk_update.xml

svn commit -m "new Version for mod_snk $version"

cp build/mod_snk_update.xml ../scoutnet_download/
cp build/mod_snk-$version-final.zip ../scoutnet_download/

cd ../scoutnet_download

ln -sf mod_snk-$version-final.zip mod_snk-current-final.zip

cd ..

echo $version > scoutnet_download/mod_snk_version.txt

svn add scoutnet_download/mod_snk-$version-final.zip
svn commit -m "new Version for mod_snk $version" scoutnet_download
fi
