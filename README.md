# org.doctales.custom-pdf

This repository contains a `Customization` directory for the DITA-OT plugin `org.dita.pdf2`. It adds additional configuration features to style PDF files generated from the DITA-OT. The idea is to customize the PDF without any coding just by setting `@outputclass` attributes and properties. The plugin is is based on [oxygenxml/dita-classic-pdf-landscape-sample](https://github.com/oxygenxml/dita-classic-pdf-landscape-sample).


## Installation

You can [download](https://github.com/doctales/org.doctales.custom-pdf/archive/master.zip) and extract the archive of this repository. You also can install it as a DITA-OT plugin by calling the following command:

```bash
dita --install https://github.com/doctales/org.doctales.custom-pdf/archive/master.zip
```


## Usage

You need to set the property `customization.dir` and point it to the `Customization` directory.

### Example 1: Ant

```xml
<target name="pdf">
    <description>Build a PDF file and use the Customization directory</description>
    <propertyfile file="pdf.properties">
        <entry key="customization.dir" value="${dita.dir}/plugins/org.doctales.custom-pdf/Customization"/>
    </propertyfile>
    <dita-cmd input="my.ditamap" format="pdf" propertyfile="pdf.properties"/>
</target
```    

### Example 2: dita command

```bash
dita --input my.ditamap --format pdf -Dcustomization.dir=org.doctales.custom-pdf/Customization
```


## Landscape Orientation

To apply landscape orientation of a topic, set the `@outputclass` attribute of the topic root element to `landscape`.

```xml
<topic id="topic" outputclass="landscape">
    <title>title</title>
    <body/>
</topic>
```


## Two Column Layout

To display a single topic in two columns, set the `@outputclass` attribute of the topic root element to `two-columns`.

```xml
<topic id="topic" outputclass="two-columns">
    <title>title</title>
    <body/>
</topic>
```
