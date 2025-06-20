public class Main{
    public static void main(String args[]){
        DocumentFactory word= new WordDocumentFactory();
        Document w= word.createDocument();
        w.open();

        DocumentFactory pdf= new PdfDocumentFactory();
        Document p= pdf.createDocument();
        p.open();

        DocumentFactory excel= new ExcelDocumentFactory();
        Document e= excel.createDocument();
        e.open();

    }
}