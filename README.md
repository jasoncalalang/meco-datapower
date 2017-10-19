# MERALCO DataPower XSLTs
## Getting Started
### Prerequisites
You would need the following:
1. XML Editor like Notepad++
2. Web browser for DataPower console

___

### Instructions for RouteToQ.xsl
1. Clone the repository.
2. Edit `RouteToQ.xsl`, and change the parameters according to the IP address and ports of the MQ Queue Managers.
3. Upload `RouteToQ.xsl` and `lookup.xml` to DataPower. They should be residing on the same directory.

#### Note: To edit `lookup.xml`, you need to change the `name` attribute according to the `noun` element of the request message. The queue name is mapped against the `name` attribute of the `noun` element in the `lookup.xml` file.

---

### Example of lookup.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<nouns>
	<noun name='TransformerLevelEvents'><queue>SODMS.CTLE.MDM.OUT</queue></noun>
	<noun name='InputKeyHere'><queue>PUT.DESTINATION.QUEUE.HERE</queue></noun>
</nouns>
```

---
### Instructions for http-dynamic.xsl
1. Clone the repository.
2. Edit `http-dynamic.xsl`, and change the parameters according to the IP address and port of the destination server.
3. Upload `http-dynamic.xsl` and `http-lookup.xml` to DataPower. They should be residing on the same directory.

---
### Example of http-lookup.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<paths>
  <path key="/example/from/path">/destination/to/path</path>
  <path key="/sample/from">/destination/to</path>
</paths>
```
