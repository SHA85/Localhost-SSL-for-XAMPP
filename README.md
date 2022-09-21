# How to Create Valid SSL in XAMPP

<h3>Step 1 - Download Certificate Generate Script</h3>
1. Download <strong>"crt"</strong> folder (includes "cert.conf" and "make-cert.bat" files). <br>
2. Move <strong>"crt"</strong> folder to <strong>"C:\xampp\apache\"</strong>. <br>

<h3>Step 2 - Generate Certificates</h3>
1. Open <strong>"crt"</strong> folder and Double click the <strong>"make-cert.bat"</strong> file. <br>
2. Type domain name like <strong>"myproject1.test"</strong> when prompted and press <strong>Enter</strong>. <br>
3. Press <strong>"Enter"</strong> if you don't want to fill information <strong>or</strong> Type for the information.<br>
4. Batch program will create folder with <strong>domain name</strong> (e.g. "project1.test"), that you enter and create "server.crt" and "server.key" in that folder.
![1Web](https://user-images.githubusercontent.com/33415417/191418086-2a33310b-0a56-4b7e-830f-a0c35903cbf8.png)


<h3>Step 3 - Install Certificate in Windows</h3>
1. Open certificate folder and Right click on <strong>"server.crt"</strong> file and Choose <strong>"Install Certificate"</strong>.<br>
2. In store location, choose <strong>"Local Machine"</strong> and click <strong>"Next"</strong> button.<br>
3. Select "Place all certificate in the following store" and click "Browse" button and select "Trusted Root Certification Authorities".
![2Web](https://user-images.githubusercontent.com/33415417/191418126-7edc1902-9e64-4c48-b4f7-c1b6fc341b0a.png)
![3Web](https://user-images.githubusercontent.com/33415417/191418154-680b74a8-dc52-4fb1-aff4-69b50c7176f1.png)
![4Web](https://user-images.githubusercontent.com/33415417/191418171-255290df-8aa9-4093-8d58-3a5727ecff50.png)

<h3>Step 4 - Add the site in Windows hosts</h3>
1. Open notepad as Administrator. (Right click on "Notepad" program and choose "Run as Administrator")<br>
2. Open <strong>"C:\Windows\System32\drivers\etc\hosts"</strong> from Notepad program.<br>
3. Add this <strong>"127.0.0.1 project1.test"</strong> in a new line.<br>
4. <strong>Save and close</strong> file.
![5Web](https://user-images.githubusercontent.com/33415417/191418236-c24bb825-b7fc-40e4-97a2-3ad1714af116.png)

<h3>Step 5 - Add the site in XAMPP conf</h3>
1. Open <strong>"C:\xampp\apache\conf\extra\httpd-xampp.conf"</strong> file.<br>
2. Add this code at the bottom:<br>
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

<h3>Step 6 - Restart Apache in XAMPP</h3>
1. Open XAMPP Control Panel and Stop and re-Start Apache Module.

<h5>* If you want to create certificate for other domain do Step 2 to Step 6.</h5>

Reference From : https://shellcreeper.com/how-to-create-valid-ssl-in-localhost-for-xampp/
