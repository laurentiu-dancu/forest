<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html class="html">
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body class="body">
		<div class="container">
			<h2 class="title">Student's Cookbook</h2>
			<table class="table">
				<xsl:for-each select="recipes/recipe">
					<xsl:sort order="descending"/>
						<tr class="row">
							<td class="entry"><xsl:value-of select="preptime"/></td>
							<td class="entry"><xsl:value-of select="cooktime"/></td>
							<td class="entry"><xsl:value-of select="name"/></td>
							<td class="entry"><xsl:value-of select="ingredients"/></td>
							<td class="entry"><xsl:value-of select="instructions"/></td>
						</tr>
				</xsl:for-each>
			</table>
		</div>
		<p>Internet Explorer: Those who play with the devil's toys will be brought by degrees to wield his sword</p>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>