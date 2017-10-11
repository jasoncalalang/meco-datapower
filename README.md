# MERALCO DataPower XSLTs
## Getting Started
### Prerequisites
You would need the following:
1. XML Editor like Notepad++
2. Web browser for DataPower console

___

### Instructions
1. Clone the repository.
2. Edit `RouteToQ.xsl`, and change the parameters according to the IP address and ports of the MQ Queue Managers.
3. Upload `RouteToQ.xsl` and `lookup.xml` to DataPower. They should be residing on the same directory.

#### Note: To edit `lookup.xml`, you need to change the `name` attribute according to the `noun` element of the request message. The queue name is mapped against the `name` attribute of the `noun` element in the `lookup.xml` file.

---

### Example

```
<?xml version="1.0" encoding="UTF-8"?>
<nouns>
	<noun name='TransformerLevelEvents'><queue>SODMS.CTLE.MDM.OUT</queue></noun>
	<noun name='InputKeyHere'><queue>PUT.DESTINATION.QUEUE.HERE</queue></noun>
</nouns>

```
