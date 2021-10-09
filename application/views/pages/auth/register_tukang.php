<main role="main" class="container">

    <div class="row">
        <div class="col-md-8 mx-auto">
            <?php $this->load->view('layouts/_alert') ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    Formulir Registrasi Tukang <a href='https://stokcoding.com/' title='StokCoding.com' target='_blank'></a>
					
                </div>
                <div class="card-body">
                    <?= form_open('register_tukang', ['method' => 'POST']) ?>
                        <div class="form-group">
                            <label for="">Nama</label>
                            <!-- Param 1: name, 2: default values, 3: atribut -->
                           <input type="text" name="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Email</label>
                           <input type="Email" name="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="">Password</label>
                            <?= form_password('password1', '', ['class' => 'form-control', 'placeholder' => 'Password minimal 8 karakter', 'required' => true]) ?>
                            <?= form_error('password') ?>
                        </div>
                        <div class="form-group">
                            <label for="">Konfirmasi Password</label>
                            <?= form_password('password2', '', ['class' => 'form-control', 'placeholder' => 'Masukkan password yang sama', 'required' => true]) ?>
                            <?= form_error('password_confirmation') ?>
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    <?= form_close() ?>
                </div>
            </div>
        </div>
    </div>
</main>
