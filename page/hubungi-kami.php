<!-- contact -->
<section class="contact-w3ls" id="contact">
  <div class="container">
    <div class="col-lg-6 col-md-6 col-sm-6 contact-w3-agile2" data-aos="flip-left">
      <div class="contact-agileits">
        <h4>Berlangganan
        </h4>
        <p class="contact-agile2">Silakan mendaftar untuk mendapatkan informasi dan promo kami
        </p>
        <form  method="post" name="sentMessage" id="contactForm" >
          <div class="control-group form-group">
            <label class="contact-p1">Nama Lengkap:
            </label>
            <input type="text" class="form-control" name="name" id="name" required >
            <p class="help-block">
            </p>
          </div>	
          <div class="control-group form-group">
            <label class="contact-p1">Nomor Telepon:
            </label>
            <input type="tel" class="form-control" name="phone" id="phone" required >
            <p class="help-block">
            </p>
          </div>
          <div class="control-group form-group">
            <label class="contact-p1">Alamat e-mail:
            </label>
            <input type="email" class="form-control" name="email" id="email" required >
            <p class="help-block">
            </p>
          </div>
          <input type="submit" name="sub" value="Send Now" class="btn btn-primary">	
        </form>
        <?php
if(isset($_POST['sub']))
{
$name =$_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$approval = "Not Allowed";
$sql = "INSERT INTO `contact`(`fullname`, `phoneno`, `email`,`cdate`,`approval`) VALUES ('$name','$phone','$email',now(),'$approval')" ;
if(mysqli_query($con,$sql))
echo"OK";
}
?>
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 contact-w3-agile1" data-aos="flip-right">
      <h4>Hubungi kami di:
      </h4>
      <p class="contact-agile1">
        <strong>Telepon :
        </strong>0895-3204-90637
      </p>
      <p class="contact-agile1">
        <strong>Email :
        </strong> 
        <a href="mailto:name@example.com">info.alfirdausi@gmail.com
        </a>
      </p>
      <p class="contact-agile1">
        <strong>Alamat :
        </strong> Maniskidul, Jalaksana, Kuningan, Jawa Barat
      </p>
      <div class="social-bnr-agileits footer-icons-agileinfo">
        <ul class="social-icons3">
          <li>
            <a href="#" class="fa fa-facebook icon-border facebook"> 
            </a>
          </li>
          <li>
            <a href="#" class="fa fa-twitter icon-border twitter"> 
            </a>
          </li>
          <li>
            <a href="#" class="fa fa-google-plus icon-border googleplus"> 
            </a>
          </li> 
        </ul>
      </div>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.85536285475!2d108.48071081431702!3d-6.907892869524484!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6f177111317ecd%3A0xf45aca541814c6f5!2sPenginapan%20Al%20Firdausi%20Kuningan!5e0!3m2!1sid!2sid!4v1609251957297!5m2!1sid!2sid" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0">
      </iframe>
    </div>
    <div class="clearfix">
    </div>
  </div>
</section>
<!-- /contact -->
<div class="copy">
  <p>© 2021 ALFIRDAUSI. All Rights Reserved | Design by 
    <a href="https://excellenz.id">Excellenz
    </a> 
  </p>
</div>
