<?php
	require('library/fpdf.php');

	class PDF extends FPDF// PDF INHERITS FROM FPDF AND OVERRIDES HEADER AND FOOTER FUNCTIONS WHICH ARE AUTOMATICALLY CALLED BY FPDF
	{
		function Header()// PAGE HEADER
		{
			//$this->Image('logo.png', 10, 6, 30);// LOGO
			$this->SetFont('Arial', 'B', 15);// MOVE TO THE RIGHT
			$this->Cell(80);// TITLE
			$this->Cell(30, 10, 'Title', 1, 0, 'C');// LINE BREAK
			$this->Ln(20);
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
	$pdf->AddPage();
	//$pdf->SetFont('Arial', 'B', 16);
	$pdf->SetFont('Times', '', 12);
	$pdf->Cell(40, 10, 'What up Dawn', 1);
	$pdf->Cell(60, 10, 'The Story Of Dawn', 0, 1, 'C');
	$textfile = fopen("books/hugovk.txt", 'r');
	if ($textfile)
	{
		while (($line = fgets($textfile)) != false)
		{
			$pdf->Cell(0, 10, $line, 0, 1);
		}
		fclose($textfile);
	}
	else
		print("ERROR OPENING FILE");
	/*
	for($i=1; $i<=40; $i++)
		$pdf->Cell(0, 10, 'Printing line number: '.$i, 0, 1);
	*/
	$pdf->Output();
?>