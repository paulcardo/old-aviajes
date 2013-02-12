/**
	_________________________________________________________________________________________________________________

	ArrayExporter is a util-class to export the Totals of a DataGrid data into different format.
	@Autor Paul Chavez (mail at paulcardo@hotmail.com)
	 * The code is based on  	DataGridDataExporter,  author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 0.01 (7/4/2008)
	@availability 9.0+
	@usage<code>ArrayExporter.<staticMethod> (arrayReference)</code>
	@example
		<code>
			var csvData:String = ArrayExporter.exportCSV (array);
		</code>
	__________________________________________________________________________________________________________________

	*/
package com.adobe.cairngorm.casinomanagement.utils
{

	public class ArrayExporter
	{
		public static function exportArrayCSV (array:Array, csvSeparator:String="\t", lineSeparator:String="\n"):String
		{
			var data:String = "";
			//loop through all columns for the row
			for(var i:int = 0; i < array.length; i++)
			{
				data += "\""+ array[i] + "\"";
				if(i < (array.length -1))
				{
					data += csvSeparator;
				}
			}
			return ("\r\n" + data);
		}
	}

}
