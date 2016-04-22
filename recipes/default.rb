package 'httpd' do
	action :install
end

service 'httpd' do
	action [:enable,:start]
end

file '/var/www/index.html' do
	contents '<html>
	<head>
		<title>Page Title</title>
	</head>
	<body>
		<h1>This is a Heading</h1>
		<p>This is a paragraph.</p>
	</body>
	</html>'
end
