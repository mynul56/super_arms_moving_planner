import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class WaybillPdfGenerator {
  static Future<void> generatePdf() async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.poppinsRegular();
    final fontBold = await PdfGoogleFonts.poppinsBold();
    final fontSemiBold = await PdfGoogleFonts.poppinsSemiBold();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            _buildHeader(fontSemiBold, fontBold),
            pw.SizedBox(height: 20),
            _buildSection1(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection2(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection3(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection4(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection5(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection6(font, fontBold),
            pw.SizedBox(height: 15),
            _buildSection7(font, fontBold),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Waybill_Consignment_Note.pdf',
    );
  }

  static pw.Widget _buildHeader(pw.Font fontSemiBold, pw.Font fontBold) {
    return pw.Column(
      children: [
        pw.Text(
          'SUPER ARMS',
          style: pw.TextStyle(
            font: fontSemiBold,
            fontSize: 18,
            color: PdfColor.fromHex('#EFB94C'),
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          'Waybill',
          style: pw.TextStyle(
            font: fontSemiBold,
            fontSize: 26,
            color: PdfColor.fromHex('#212529'),
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildSection1(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '1. Information About The mover',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        _buildInfoRow('Company Name:', 'Super Arms', font),
        _buildInfoRow('Adress:', 'Paris, France', font),
        _buildInfoRow('Siret:', '323032030', font),
      ],
    );
  }

  static pw.Widget _buildSection2(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '2. Information About The Client',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        _buildInfoRow('Name:', 'Al Muntakim', font),
        _buildInfoRow('Adress:', 'Paris, France', font),
      ],
    );
  }

  static pw.Widget _buildSection3(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '3. Location And Date Of The Move',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        _buildInputRow('Departure Address:', 'Paris, France', font),
        pw.SizedBox(height: 8),
        _buildInputRow('Arrival Address:', 'Paris, France', font),
        pw.SizedBox(height: 8),
        _buildInputRow('Moving Date:', '12/09/2025 8Am', font),
      ],
    );
  }

  static pw.Widget _buildSection4(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '4. Description Of The Service',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        _buildInputRow('Estimated Volume:', '23m³', font),
        pw.SizedBox(height: 8),
        _buildInputRow('number Of Movers:', '3', font),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Equipment Used:',
              style: pw.TextStyle(font: font, fontSize: 12),
            ),
            pw.Row(
              children: [
                // Simplified checkbox representation for PDF
                pw.Container(
                  width: 12,
                  height: 12,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.circle,
                    color: PdfColor.fromHex('#EFB94C'),
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Text('Boxes', style: pw.TextStyle(font: font, fontSize: 12)),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        _buildInputRow('Particularities:', 'Move with Care', font),
      ],
    );
  }

  static pw.Widget _buildSection5(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '5. Condition Report',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        _buildInputRow('Note On Arrival:', 'Some Text', font),
      ],
    );
  }

  static pw.Widget _buildSection6(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '5. Consignment Report',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 8),
        pw.Container(
          width: double.infinity,
          height: 60,
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(8),
            border: pw.Border.all(color: PdfColor.fromHex('#EFB94C')),
          ),
          child: pw.Text(
            'A Painting Was Scratches',
            style: pw.TextStyle(font: font, fontSize: 12),
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildSection7(pw.Font font, pw.Font fontBold) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '5. Signatures',
          style: pw.TextStyle(font: fontBold, fontSize: 14),
        ),
        pw.SizedBox(height: 12),
        _buildSignatureBlock('Movers Signature', font),
        pw.SizedBox(height: 15),
        _buildSignatureBlock('Client Signature', font),
      ],
    );
  }

  static pw.Widget _buildSignatureBlock(String title, pw.Font font) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title, style: pw.TextStyle(font: font, fontSize: 12)),
        pw.SizedBox(height: 6),
        pw.Row(
          children: [
            pw.Text('Done At', style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(width: 4),
            pw.Expanded(child: _dashedLine()),
            pw.SizedBox(width: 4),
            pw.Text('on', style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(width: 4),
            pw.SizedBox(width: 30, child: _dashedLine()),
            pw.Text('/', style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(width: 30, child: _dashedLine()),
            pw.Text('/', style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(width: 30, child: _dashedLine()),
          ],
        ),
        pw.SizedBox(height: 6),
        pw.Row(
          children: [
            pw.Text('Name:', style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(width: 4),
            pw.Expanded(child: _dashedLine()),
          ],
        ),
        pw.SizedBox(height: 6),
        pw.Row(
          children: [
            pw.Text(
              'Signature:',
              style: pw.TextStyle(font: font, fontSize: 12),
            ),
            pw.SizedBox(width: 4),
            pw.Expanded(child: _dashedLine()),
          ],
        ),
      ],
    );
  }

  static pw.Widget _dashedLine() {
    return pw.Container(
      height: 1,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            width: 1,
            style: pw.BorderStyle.dashed,
            color: PdfColors.grey700,
          ),
        ),
      ),
    );
  }

  static pw.Widget _buildInfoRow(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(font: font, fontSize: 12)),
          pw.Text(
            value,
            style: pw.TextStyle(
              font: font,
              fontSize: 12,
              color: PdfColors.grey700,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildInputRow(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(font: font, fontSize: 12)),
          pw.Container(
            width: 150,
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(8),
              border: pw.Border.all(color: PdfColor.fromHex('#EFB94C')),
            ),
            child: pw.Text(
              value,
              style: pw.TextStyle(font: font, fontSize: 12),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
