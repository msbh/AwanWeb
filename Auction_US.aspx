<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Auction_US.aspx.vb" Inherits="Auction" Title="Auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <ul class="myform_heading">
            <span style="color: #F0F0F0">Auction </span>
        </ul>
        <ul class="myform_line">
        </ul>
        <p class="class">
            As you become a registered member of AwanInternational K.K, you will get access
            to more than 100 auction houses and as a result around 30,000 cars each day. You
            can find a car, car parts, view its details, and even bid a car right from your
            desktop at the comfort of your home.</p>
        <p class="class">
            At AwanInternational K.K, the entire process of used car auction is as easy as 1,
            2, 3 See the steps below.</p>
        <br />
        <p>
            <span class="class_span1">Step-1</span> <span class="class_span2">Become a registered
                member</span></p>
        <p class="class">
            <a href="/user/register" target="">Register</a> to become a member of AwanInternational
            K.K and get access to the entire stock available at multiple auction houses.
        </p>
        <p>
            <span class="class_span1">Step-2</span> <span class="class_span2">Security Deposit</span></p>
        <p class="class">
            Deposit an initial security amount which is usually $1,000 or Yen 100,000 to bid
            for a vehicle worth less than 1 million. We need to hold this amount before we bid
            on any of the cars. If the bid does not get successful, security deposit is fully
            refundable or adjustable in the customer's account based on customer's request.
            <br />
        </p>
        <table cellspacing="0" cellpadding="5" align="center" class="auctionTable">
            <tr>
                <td colspan="6">
                    <span class="class_span2">Bidding Deposit Details.</span>
                </td>
            </tr>
            <tr>
                <th class="auction1">
                    Deposit Rank
                </th>
                <th class="auction2">
                    Deposit Amount USD
                </th>
                <th class="auction3">
                    Buying Budget 2000% USD
                </th>
                <th class="auction4">
                    Deposit Amount Yen
                </th>
                <th class="auction5">
                    Buying Budget 2000% Yen
                </th>
                <th class="auction6">
                    Purchasing Limit
                </th>
            </tr>
            <tr>
                <th class="auctiondowm1">
                    A
                </th>
                <th class="auctiondowm2">
                    $10,000
                </th>
                <th class="auctiondowm3">
                    $200,000
                </th>
                <th class="auctiondowm4">
                    \1,000,000
                </th>
                <th class="auctiondowm5">
                    \20,000,000
                </th>
                <th class="auctiondowm6">
                    No Limit
                </th>
            </tr>
            <tr>
                <th class="auctiondowm1">
                    B
                </th>
                <th class="auctiondowm2">
                    $5,000
                </th>
                <th class="auctiondowm3">
                    $100,000
                </th>
                <th class="auctiondowm4">
                    \500,000
                </th>
                <th class="auctiondowm5">
                    \10,000,000
                </th>
                <th class="auctiondowm6">
                    10 Units
                </th>
            </tr>
            <tr>
                <th class="auctiondowm1">
                    C
                </th>
                <th class="auctiondowm2">
                    $3,000
                </th>
                <th class="auctiondowm3">
                    $60,000
                </th>
                <th class="auctiondowm4">
                    \300,000
                </th>
                <th class="auctiondowm5">
                    \6,000,000
                </th>
                <th class="auctiondowm6">
                    4 Units
                </th>
            </tr>
            <tr>
                <th class="auctiondowm1">
                    D
                </th>
                <th class="auctiondowm2">
                    $2,000
                </th>
                <th class="auctiondowm3">
                    $40,000
                </th>
                <th class="auctiondowm4">
                    \200,000
                </th>
                <th class="auctiondowm5">
                    \4,000,000
                </th>
                <th class="auctiondowm6">
                    3 Units
                </th>
            </tr>
            <tr>
                <th class="auctiondowm1">
                    E
                </th>
                <th class="auctiondowm2">
                    $1,000
                </th>
                <th class="auctiondowm3">
                    $20,000
                </th>
                <th class="auctiondowm4">
                    \100,000
                </th>
                <th class="auctiondowm5">
                    \2,000,000
                </th>
                <th class="auctiondowm6">
                    1 Unit
                </th>
            </tr>
            <tr>
                <br />
                <td colspan="6">
                    <font class="class"><b>We need above deposit from the customer to allow him to start
                        bidding.</b></font>
                </td>
            </tr>
        </table>
        <p>
            <span class="class_span1">Step-3</span> <span class="class_span2">Bidding Cars from
                Auction</span></p>
        <p class="class">
            Please, fill up lot number, car name and the bidding price in the Auction order
            form.
        </p>
        <p class="class">
            We will only charge the actual auction price at which the bid is won. So try to
            bid as higher as you can in order to increase the chances of winning the bid.
        </p>
        <p>
            <span class="class_span1">Step-4</span> <span class="class_span2">Auction Result</span></p>
        <p class="class">
            As we get succeed with your bid, we will notify you that your bidding has got success.
            You will receive an invoice that includes total price of car. The price will be
            calculated with the original selling price of auction.</p>
        <p>
            <span class="class_span1">Step-5 <span class="class_span2">Final Payment</span></p>
        <p class="class">
            The final payment will be paid in 5 working days. Payments made on the committed
            time will help us save your order from cancellation.</p>
        <p>
            <span class="class_span1">Step-6 <span class="class_span2">Shipment</span></p>
        <p class="class">
            The shipment will be arranged as soon as the payment is confirmed.
        </p>
        <p class="class">
            Note: At <a href="www.awan.co.jp">Awan.co.jp</a> you will find the best shipping
            services with lowest
        </p>
        <p>
            <span class="class_span1">Step -7<span class="class_span2"> Documents</span></p>
        <p class="class">
            As the ship leaves from Japan, we will send all the documents by EMS, DHL or FedEx.
            The documents included are;
        </p>
        <p class="class">
            Export Certificate
        </p>
        <p class="class">
            Bill Of Lading
        </p>
        <p class="class">
            Invoice
        </p>
        <p class="class">
            Marine Insurance if any
        </p>
        <p class="class">
            JAAI Inspection and other inspections, if any
        </p>
        <p class="class">
            Note: There are no extra or hidden charges other than CNF or CIF price. All the
            charges are included in mentioned price
        </p>
        <p class="class">
            Payment Method & Bank Charges</p>
        <p class="class">
            </strong> You can arrange payment via telegraphic transfer through your bank. All
            bank charges must be paid by the sender. Please, ensure that payment is in US Dollars
            / Japanese Yen, and please include your Invoice & Stock number in the description
            field.
        </p>
        <p class="class">
            Payment can also be made online via PayPal through your credit cards.</p>
        <p class="class">
            Terms for Payment via PayPal</p>
        <p class="class">
            There will be a 4% handling fee on top of the invoice amount.</p>
        <p class="class">
            Payment limit through PAYPAL is:minimum USD100, maximum USD10,000
        </p>
        <p class="class">
            <b>(Maximum amount depends on your registering country, so please consult to PAYPAL
                for your limitation.)</b></p>
        <p class="class">
            Once the payment has been arranged, please, send us confirmation of payment with
            Proforma Invoice and/or full name, address, Telephone/Fax number for contact purposes
            by <b>info@awan.co.jp or Fax +9714-3338570.</b>
            <br />
            The amount of the payments decided on the mutual agreement must be made in full.
            We will only arrange the shipping once the payment is received. For further information
            about shipping and payments, please read our <a href="TermsandConditions.aspx">Terms
                & Conditions </a>. or contact <a href="mailto:info@awan.co.jp">info@awan.co.jp</a>
        </p>
        <h3>
            Auction Links
        </h3>
        <p class="class">
            <a href="https://www.iauc.co.jp/pv/top1.html">
                <img src="images/iauc.gif" style="border: 0px;">
            </a>
            <br />
            <a href="http://was.autoserver.co.jp/asnete/top/logon.asp">
                <img src="images/asnet.gif" style="border: 0px;">
            </a>
        </p>
        <p class="class js_a">
            <a href="http://www.japan-used-car-exporting.info/import/auto-auctions-in-japan.html">
                Useful Auto Auctions in Japan </a>
            <br />
            <a href="http://www.japan-used-car-exporting.info/import/map-of-auto-auctions-in-japan.html">
                Map of Auto Auctions in Japan </a>
        </p>
    </div>
</asp:Content>
