<?php
	require('library/fpdf.php');
	$pdf = new FPDF('L', 'mm', 'Legal');
	$pdf->AddPage();
	$pdf->SetFont('ZapfDingbats', 'B', 16);
	$pdf->Cell(40, 10, 'What up Dawn', 1);
	$pdf->Output();
?>