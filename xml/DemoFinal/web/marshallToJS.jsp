<%-- 
    Document   : mashallToJS
    Created on : Jul 8, 2019, 12:46:52 PM
    Author     : nguyenhongphat0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var count = 0;
            var cells = [];
            var xmlHttp;
            var xmlDOM;
            function addRow(tableID, cells) {
                var tableElement = document.getElementById(tableID);
                var newRow = tableElement.insertRow(tableElement.rows.length);
                var newCell;
                for (var i = 0; i < cells.length; i++) {
                    newCell = newRow.insertCell(newRow.cells.length);
                    newCell.innerHTML = cells[i];
                }
            }
            function deleteRow(tableId, rowNumber) {
                var tableElement = document.getElementById(tableId);
                if (rowNumber > 0 && rowNumber < tableElement.rows.length) {
                    tableElement.deleteRow(rowNumber);
                } else {
                    alert('failed');
                }
            }
            function searchNode(node, tableName) {
                if (node === null) {
                    return;
                }
                if (node.tagName === 'booktitle') {
                    count++;
                    cells[0] = count;
                    cells[1] = node.firstChild.nodeValue;
                    var sibling = node.nextElementSibling;
                    cells[2] = sibling.firstChild.textContent;
                    addRow(tableName, cells);
                }
                var childs = node.childNodes;
                for (var i = 0; i < childs.length; i++) {
                    searchNode(childs[i], tableName);
                }
            }
            function traversalDOMTree(tableName) {
                var tableElement = document.getElementById(tableName);
                var i = 1;
                while (i < tableElement.rows.length) {
                    deleteRow(tableName, i);
                }
                count = 0;
                update();
            }
            function GetXMLHttpObject() {
                var xmlHttp = null;
                try {
                    // Firefox, Opera, Safari
                    xmlHttp = new XMLHttpRequest();
                } catch (e) {
                    // IE
                    try {
                        xmlHttp = new ActiveXObject('Msxml12.XMLHTTP');
                    } catch (e) {
                        xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                }
                return xmlHttp;
            }
            function update() {
                xmlHttp = GetXMLHttpObject();
                if (xmlHttp === null) {
                    alert('This browser does not support AJAX');
                    return;
                }
                var url = 'MarshallToJavaScript';
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
            }
            function handleStateChange() {
                if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                    var tmp = xmlHttp.responseText;
                    var parser = new DOMParser();
                    xmlDOM = parser.parseFromString(tmp, "application/xml");
                    searchNode(xmlDOM, 'dataTable');
                }
            }
        </script>
    </head>
    <body>
        <h1>Marshall Combine JS Demo</h1>
        <form name="myForm">
            <input type="button" value="Search" onclick="traversalDOMTree('dataTable')" />
        </form>
        <table border="1" id="dataTable">
            <tr>
                <td>No.</td>
                <td>Name</td>
                <td>Author</td>
            </tr>
        </table>
    </body>
</html>
