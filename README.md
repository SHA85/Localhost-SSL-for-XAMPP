# How to Create Valid SSL in XAMPP

<h3>Generating Certificate File</h3>
1. Download <strong>"crt"</strong> folder (includes "cert.conf" and "make-cert.bat" files). <br>
2. Move <strong>"crt"</strong> folder to <strong>"C:\xampp\apache\"</strong>. <br>
3. Open <strong>"crt"</strong> folder and Double click the <strong>"make-cert.bat"</strong> file. <br>
4. Type domain name like <strong>"myproject1.test"</strong> when prompted and press <strong>Enter</strong>. <br>
5. Press <strong>"Enter"</strong> if you don't want to fill information <strong>or</strong> Type for the information.<br>
6. Batch program will create folder with <strong>domain name</strong> (e.g. "project1.test"), that you enter and create "server.crt" and "server.key" in that folder.

<h3>Install Certificate in Windows</h3>
1. Open certificate folder and Right click on <strong>"server.crt"</strong> file and Choose <strong>"Install Certificate"</strong>.<br>
2. In store location, choose <strong>"Local Machine"</strong> and click <strong>"Next"</strong> button.<br>
3. Select "Place all certificate in the following store" and click "Browse" button and select "Trusted Root Certification Authorities".

<h3>Add the site in Windows hosts</h3>
1. Open notepad as Administrator. (Right click on "Notepad" program and choose "Run as Administrator")<br>
2. Open <strong>"C:\Windows\System32\drivers\etc\hosts"</strong> from Notepad program.<br>
3. Add this <strong>"127.0.0.1 project1.test"</strong> in a new line.<br>
4. <strong>Save and close</strong> file.

<h3>Add the site in XAMPP conf</h3>
1. Open <strong>"C:\xampp\apache\conf\extra\httpd-xampp.conf"</strong> file.<br>
2. And add this code at the bottom:<br>
<p><strong>
#project1.test <br>
&ltVirtualHost *:443&gt <br>
&nbsp;&nbsp;&nbsp;&nbsp;DocumentRoot "C:/xampp/htdocs/project1" <br>
&nbsp;&nbsp;&nbsp;&nbsp;ServerName project1.test <br>
&nbsp;&nbsp;&nbsp;&nbsp;ServerAlias *.project1.test <br>
&nbsp;&nbsp;&nbsp;&nbsp;SSLEngine on <br>
&nbsp;&nbsp;&nbsp;&nbsp;SSLCertificateFile "crt/site.test/server.crt" <br>
&nbsp;&nbsp;&nbsp;&nbsp;SSLCertificateKeyFile "crt/site.test/server.key" <br>
&lt/VirtualHost&gt</strong>
</p>

<h3>Restart Apache in XAMPP</h3>
1. Open XAMPP Control Panel and Stop and re-Start Apache Module.

Reference From : https://shellcreeper.com/how-to-create-valid-ssl-in-localhost-for-xampp/
