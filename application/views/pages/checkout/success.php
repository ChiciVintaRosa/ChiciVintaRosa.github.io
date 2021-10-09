<main role="main" class="container">

    <div class="row">
        <div class="col-md-12">
            <?php $this->load->view('layouts/_alert') ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    Checkout berhasil
                </div>
                <div class="card-body">
                    <h5>Nomor order: <?= $content->invoice ?></h5>
                    <p>Terima kasih sudah melakukan pemesanan.</p>
                    <p>Silahkan lakukan pembayaran untuk bisa kami proses selanjutnya dengan cara:</p>
                    <ol>
                        <li>Lakukan pembayaran pada rekening <strong>BSI 025601071216504</strong> a/n CHICI VINTA ROSA</li>
                        <li>Sertakan keterangan dengan nomor order: <strong><?= $content->invoice ?></strong></li>
                        <li>Total pembayaran: <strong>Rp.<?= number_format($content->total, 0, ',', '.') ?>,-</strong></li>
                    </ol>
                    <p>Jika sudah melakukan pemayaran, silahkan kirimkan bukti transfer di halaman konfirmasi atau bisa <a href="<?= base_url("myorder/detail/$content->invoice") ?>">klik disini</a></p>
                    <a href="<?= base_url('home') ?>" class="btn btn-primary"><i class="fas fa-angle-left"></i> Kembali</a>
                </div>
            </div>
        </div>
    </div>
</main>