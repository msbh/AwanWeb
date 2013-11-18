<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="membership2.aspx.vb" Inherits="membership2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/myform.css" rel="stylesheet" type="text/css" />
    <div id="formContainer">
        <h1>
            Request a Quote</h1>
        <div class="formRow">
            <label for="field0">
                Your name<span class="star">*</span>:
            </label>
            <input type="text" class="textField required" id="field0" name="field0">
        </div>
        <div class="formRow">
            <label for="field1">
                Email<span class="star">*</span>:
            </label>
            <input type="text" class="textField required email" id="field1" name="field1">
        </div>
        <div class="formRow">
            <label for="field2">
                Project Type<span class="star">*</span>:
            </label>
            <select class="select required" id="field2" name="field2" >
                <option value="0" selected="selected">Please Select</option>
                <option value="1">Design</option>
                <option value="2">Illustration</option>
                <option value="3">Development</option>
                <option value="4">Marketing</option>
                <option value="5">SEO</option>
            </select>
           
      
           
           
           
           
            <span style="width: 107px; z-index: 1000;" class="selectContainer">
                <div class="selectBox">
                    Please Select</div>
                <span></span>
                <ul class="dropDown" style="display: none;">
                    <li>Please Select</li><li>Design</li><li>Illustration</li><li>Development</li><li>Marketing</li><li>
                        SEO</li></ul>
                        
                        
                        
                        
                        
                        
            </span>
        </div>
        <div class="formRow">
            <label for="field3">
                Time Frame:
            </label>
            <select class="select" id="field3" name="field3" style="display: none;">
                <option value="0">Choose a time frame</option>
                <option value="1">A Month</option>
                <option value="2">Two to three weeks</option>
                <option value="3">A day</option>
                <option value="4">RIGHT NOW!</option>
            </select><span style="width: 146px; z-index: 999;" class="selectContainer"><div class="selectBox">
                Choose a time frame</div>
                <span></span>
                <ul class="dropDown" style="display: none;">
                    <li>Choose a time frame</li><li>A Month</li><li>Two to three weeks</li><li>A day</li><li>
                        RIGHT NOW!</li></ul>
            </span>
        </div>
        <div class="formRow">
            <label for="field4">
                Description<span class="star">*</span>:
            </label>
            <textarea class="textArea required" cols="40" rows="5" id="field4" name="field4"></textarea>
        </div>
        <div class="formRow">
            <label for="field5">
                Payment<span class="star">*</span>:
            </label>
            <input type="radio" value="0" class="radio required" id="field5_0" name="field5"
                style="display: none;"><span class="radio"></span>
            <label class="radioLabel" for="field5_0">
                Upfront</label>
            <input type="radio" value="1" class="radio required" id="field5_1" name="field5"
                style="display: none;"><span class="radio checked"></span>
            <label class="radioLabel" for="field5_1">
                Upon Completion</label>
        </div>
        <div class="formRow">
            <label for="field6">
                Support Needed:
            </label>
            <input type="checkbox" class="checkBox" id="field6" name="field6" style="display: none;"><span
                class="checkBox  checked"></span>
        </div>
        <div class="formRow">
            <label for="field7">
                10 + 5 =
            </label>
            <input type="text" class="textField required captcha" id="field7" name="field7">
        </div>
        <div class="formRow">
            <input type="submit" id="submit" value="Submit Form" style="display: none;"><span
                class="button">Submit Form<span></span></span>
        </div>
    </div>
</asp:Content>
