<?php
	require('library/fpdf.php');
	$pdf = new FPDF();
	$pdf->AddPage();
	$pdf->SetFont('Arial', 'B', 16);
	$pdf->Cell(40, 10, 'What up Bees');
	$pdf->Output();
?>