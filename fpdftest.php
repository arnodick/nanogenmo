<?php
	require('library/fpdf.php');
	$pdf = new FPDF('L', 'mm', 'Legal');
	$pdf->AddPage();
	$pdf->SetFont('Arial', 'B', 16);
	$pdf->Cell(40, 10, 'What up Dawn', 1);
	$pdf->Cell(60, 10, 'The Story Of Dawn', 0, 1, 'C');
	$pdf->Output();
?>