<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <pattern>
        <rule context="id">
            <let name="basename" value="replace(base-uri(.), '^.*/(.*?)$', '$1')"/>
            <assert test="$basename = concat(., '.xml')">The id “<value-of select="."/>” does
                not match filename “<value-of select="$basename"/>”</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="body">
            <let name="length" value=". => normalize-space() => string-length()"/>
            <assert test="$length le 450" role="warn">The body is too long, at <value-of select="$length"/> characters. Reduce it to 450 characters to fit into the available space on the web page.</assert>
        </rule>
    </pattern>
</schema>