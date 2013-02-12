/**
	_________________________________________________________________________________________________________________

	DataExporter is a util-class to export the Totals of a DataGrid data into different format.
	@Autor Paul Chavez (mail at paulcardo@hotmail.com)
	 * The code is based on  	DataGridDataExporter,  author Abdul Qabiz (mail at abdulqabiz dot com)
	@version 0.01 (7/4/2008)
	@availability 9.0+
	@usage<code>DataExporter.<staticMethod> (arrayReference)</code>
	@example
		<code>
			var csvData:String = DataExporter.exportCSV (array);
		</code>
	__________________________________________________________________________________________________________________

	*/
package com.adobe.cairngorm.project.utils
{
	import com.abdulqabiz.utils.DataGridDataExporter;
	
	import flash.system.System;
	import flash.ui.Mouse;
	
	import spark.components.DataGrid;
	import mx.managers.CursorManager;
	
	public class DataExporter
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
		
		public static function exportGridAndTotalsCSV(dg:DataGrid, array:Array):void
		{
			CursorManager.setBusyCursor();
			var strCSV : String;
			strCSV = DataGridDataExporter.exportCSV(dg);
			strCSV += exportArrayCSV(array);
			System.setClipboard( strCSV )
			CursorManager.removeBusyCursor();
		}
		
		public static function exportGridAndTwoTotalsCSV(dg:DataGrid, arrayOne:Array, arrayTwo:Array):void
		{
			CursorManager.setBusyCursor();
			var strCSV : String;
			strCSV = DataGridDataExporter.exportCSV(dg);
			strCSV += exportArrayCSV(arrayOne);
			strCSV += exportArrayCSV(arrayTwo);
			System.setClipboard( strCSV )
			CursorManager.removeBusyCursor();
		}
	}

}
