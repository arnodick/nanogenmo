<?php
	require('library/fpdf.php');

	class PDF extends FPDF// PDF INHERITS FROM FPDF AND OVERRIDES HEADER AND FOOTER FUNCTIONS WHICH ARE AUTOMATICALLY CALLED BY FPDF
	{
		function Header()// PAGE HEADER
		{
			//$this->Image('logo.png', 10, 6, 30);// LOGO
			$this->SetFont('Arial', 'B', 15);
			$this->Cell(80);// MOVE TO THE RIGHT
			$this->Cell(30, 10, 'Title', 0, 0, 'C');// TITLE
			$this->Ln(20);// LINE BREAK
		}

		function Footer()// PAGE FOOTER
		{
			$this->SetY(-15);// POSITION AT 15mm FROM BOTTOM
			$this->SetFont('Arial', 'I', 8);
			$this->Cell(0, 10, 'Page '.$this->PageNo().'/{nb}', 0, 0, 'C');// PAGE NUMBER
		}
	}


	//$pdf = new FPDF('L', 'mm', 'Legal');
	$pdf = new PDF();
	$pdf->AliasNbPages();
	$pdf->SetTitle("The Book");
	$pdf->SetAuthor("Ashley Pringle");
	$pdf->SetDisplayMode("fullpage", "two");
	$pdf->SetKeywords("choose your own adventure");
	$pdf->SetSubject("Adventure");
	$pdf->AddPage();
	$link = $pdf->AddLink();//make a link
	$pdf->SetLink($link);//the link goes to the first page
	$pdf->SetFont('Times', '', 12);
	$textfile = fopen("books/hugovk.txt", 'r');
	if ($textfile)
	{
		while (($line = fgets($textfile)) != false)
		{
			//$pdf->Cell(0, 10, $line, 0, 1);
			$pdf->MultiCell(0, 8, $line);
		}
		fclose($textfile);
	}
	else
		print("ERROR OPENING FILE");
	$pdf->SetTextColor(40, 40, 185);
	$pdf->Write(8, 'LINK', $link);//at the end of the pdf, write some text with the link that goes back to the first of the pdf
	$pdf->Output("I", "story.pdf");
?>