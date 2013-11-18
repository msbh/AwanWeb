Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class admin_stockdetails
    Inherits System.Web.UI.Page

    Dim StockImagesPath As String

   
    Protected Sub cmdADDNEW_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdADDNEW.Click
        Response.Redirect("stockdetails.aspx", False)
    End Sub

    Protected Sub cmdSAVE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdSAVE.Click
        Try

            If String.IsNullOrEmpty(txtchassisno.Text) = False Or txtchassisno.Text.ToString.Length > 5 Then

                Upload_Files()
                Save_Record()

            Else

                lblmsg.Text = "Invalid Chassis No"


            End If
           

        Catch ex As Exception

        End Try

    End Sub
    Private Sub Save_Record()
        Try
            Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString)
            Dim cmd As SqlCommand
            Dim obj As New dsStockTableAdapters.newSTOCK_LISTTableAdapter
            Dim Display_Type As String = String.Empty

            For i As Integer = 0 To Me.ddlwebdisplaytype.Items.Count - 1
                If Me.ddlwebdisplaytype.Items(i).Selected = True Then
                    Display_Type = Me.ddlwebdisplaytype.Items(i).Value.Trim & "," & Display_Type

                End If
            Next

            Display_Type = "0," & Display_Type

            Dim StockImagesPath As String = ConfigurationManager.AppSettings.Get("stockimages_path")
            Dim strPref_L As String = appdata.Stock_Pref_L
            Dim strPref_R As String = appdata.Stock_Pref_R

            Display_Type = Display_Type.Remove(Display_Type.Length - 1, 1)

            If Me.Hupdate_Flag.Value = 0 Then


                Dim cat_type_ID As Integer = IIf(String.IsNullOrEmpty(Me.ddltype.SelectedValue), 0, Me.ddltype.SelectedValue)

                Dim msg As Object = obj.insert_stock(txtchassisno.Text, ddlstatus.SelectedValue, CInt(Me.ddlcountry.SelectedValue), "", "", 1, "", _
                ddlShowroom.SelectedValue, "", "", Me.txtentry_date.Text, Me.txtmodel.Text, Me.ddlcolor.SelectedItem.Text, _
                ddltransmission.SelectedValue, ddldoor.SelectedValue, ddlmake.SelectedItem.Text, ddlMakeName.SelectedItem.Text, _
                ddlmake_category.SelectedItem.Text, txtoptions.Text, txtHsCode.Text, rdbdrive.SelectedValue, ddlFuel.SelectedItem.Text, _
                "", rdbused.SelectedValue, ddlmake_country.SelectedValue, txtengine_no.Text, "", txtweight.Text, txtop_yen.Text, _
                txtOP_dhs.Text, ddlC_type.SelectedValue, txtOP_yen_rate.Text, txtfreight_yen.Text, 0, 0, "", chkAC.Checked, chkPW.Checked, chkPS.Checked, _
                chkP_MIR.Checked, chkPLK.Checked, chkCAS.Checked, 0, chkdvd.Checked, _
                chkMD_Player.Checked, chkTV_NAVI.Checked, chkaac.Checked, chkwac.Checked, chkabs.Checked, chkAirbag.Checked, chkDual_Airbag.Checked, _
                chkaw.Checked, chkSun_Roof.Checked, chkTwin_Sun_Roof.Checked, chk4x4.Checked, chk6x6.Checked, chkLeather_Seats.Checked, _
                chkDigital_Meter.Checked, chkBack_Tyre.Checked, chkFender_Mirror.Checked, chkGuard_Grill.Checked, _
                0, 0, 0, chkFog_Lights.Checked, chkBack_Censor.Checked, chkbackcamera.Checked, chkkey_less.Checked, chkToll_Tax_Dedector.Checked, _
                0, chkRoofRail.Checked, chkBodyKit.Checked, chkSeat_Heater.Checked, chkCD_Changer.Checked, chkOne_Owner.Checked, _
                chkRear_Spoiler.Checked, chkFront_Spoiler.Checked, chkTool_Kit.Checked, chkExtra_Tyre.Checked, _
                HiddenField1.Value, HiddenField2.Value, HiddenField3.Value, HiddenField4.Value, HiddenField5.Value, HiddenField6.Value, HiddenField7.Value, _
                HiddenField8.Value, HiddenField9.Value, HiddenField10.Value, Me.ddlFuel.SelectedValue, Me.ddlcolor.SelectedValue, Me.ddlmake.SelectedValue, _
                Me.ddlMakeName.SelectedValue, Me.txtseats.Text, Me.txtmileage.Text, Me.txtCC.Text, "", "", "", "", txtVeh_Grade.Text, "", "", _
                Me.txtlenght.Text, Me.txtwidth.Text, Me.txtheight.Text, ddlInteriorColor.SelectedValue, ddlmake_category.SelectedValue, _
                cat_type_ID, 0, ddllocation.SelectedValue, "", "", "", "", False, "", "", Me.txtCF_price.Text, _
                txtci_price.Text, Me.txtcif_price.Text, Me.txtfob_price.Text, Me.txtsellingpricecode.Text, Display_Type, _
                ddlDisplayPriority.SelectedValue, ddlcurrency.SelectedValue, Me.txtsold_date.Text, ddlSellingCurr.SelectedValue, Stock_Pref_L, Stock_Pref_R, StockImagesPath, CInt(ddlImportType.SelectedValue), "")
                Hupdate_Flag.Value = 1
                Dim message() As String = msg.ToString.Split(",")
                'Mustafa Work For Regional Cities
                Dim Mainid As Integer
                If con.State = ConnectionState.Closed Then con.Open()
                cmd = New SqlCommand("select MAX(id) as id from MAIN ", con)
                Mainid = Convert.ToInt32(cmd.ExecuteScalar)
                Dim query As String
               

                For Each itm As DataListItem In DlReviewImages.Items
                    If itm.ItemType = ListItemType.Item OrElse itm.ItemType = ListItemType.AlternatingItem Then
                        Dim hdnID As HiddenField = DirectCast(itm.FindControl("hdnID"), HiddenField)
                        Dim chkbx As CheckBox = DirectCast(itm.FindControl("chkbx"), CheckBox)
                        If chkbx.Checked = True Then
                            query = "Insert Into StockRegional(MainID, RCID) Values(" + Mainid.ToString() + ", " + hdnID.Value + ")"
                            cmd = New SqlCommand(query, con)
                            cmd.ExecuteNonQuery()
                        End If
                       
                    End If
                Next
                con.Close()
                'Mustafa Work For Regional Cities
                lblmsg.Text = message(0)
                Me.txtfile_ref.Text = message(1)

            Else

                Dim msg As Object = obj.update_stock(hID.Value, txtfile_ref.Text, txtchassisno.Text, ddlstatus.SelectedValue, CLng(ddlcountry.SelectedValue), "", "", 1, "", _
                ddlShowroom.SelectedValue, "", "", Me.txtentry_date.Text, Me.txtmodel.Text, Me.ddlcolor.SelectedItem.Text, _
                ddltransmission.SelectedValue, ddldoor.SelectedValue, ddlmake.SelectedItem.Text, ddlMakeName.SelectedItem.Text, _
                ddlmake_category.SelectedItem.Text, txtoptions.Text, txtHsCode.Text, rdbdrive.SelectedValue, ddlFuel.SelectedItem.Text, _
                "", rdbused.SelectedValue, ddlmake_country.SelectedValue, txtengine_no.Text, "", txtweight.Text, txtop_yen.Text, _
                txtOP_dhs.Text, ddlC_type.SelectedValue, txtOP_yen_rate.Text, txtfreight_yen.Text, 0, 0, "", chkAC.Checked, chkPW.Checked, chkPS.Checked, _
                chkP_MIR.Checked, chkPLK.Checked, chkCAS.Checked, 0, chkdvd.Checked, _
                chkMD_Player.Checked, chkTV_NAVI.Checked, chkaac.Checked, chkwac.Checked, chkabs.Checked, chkAirbag.Checked, chkDual_Airbag.Checked, _
                chkaw.Checked, chkSun_Roof.Checked, chkTwin_Sun_Roof.Checked, chk4x4.Checked, chk6x6.Checked, chkLeather_Seats.Checked, _
                chkDigital_Meter.Checked, chkBack_Tyre.Checked, chkFender_Mirror.Checked, chkGuard_Grill.Checked, _
                0, 0, 0, chkFog_Lights.Checked, chkBack_Censor.Checked, chkbackcamera.Checked, chkkey_less.Checked, chkToll_Tax_Dedector.Checked, _
                0, chkRoofRail.Checked, chkBodyKit.Checked, chkSeat_Heater.Checked, chkCD_Changer.Checked, chkOne_Owner.Checked, _
                chkRear_Spoiler.Checked, chkFront_Spoiler.Checked, chkTool_Kit.Checked, chkExtra_Tyre.Checked, _
                HiddenField1.Value, HiddenField2.Value, HiddenField3.Value, HiddenField4.Value, HiddenField5.Value, HiddenField6.Value, _
                HiddenField7.Value, HiddenField8.Value, HiddenField9.Value, HiddenField10.Value, _
                CInt(Me.ddlFuel.SelectedValue), CInt(Me.ddlcolor.SelectedValue), CInt(Me.ddlmake.SelectedValue), _
                CInt(Me.ddlMakeName.SelectedValue), Me.txtseats.Text, Me.txtmileage.Text, Me.txtCC.Text, "", "", "", "", txtVeh_Grade.Text, "", "", _
                Me.txtlenght.Text, Me.txtwidth.Text, Me.txtheight.Text, CInt(ddlInteriorColor.SelectedValue), CInt(ddlmake_category.SelectedValue), _
                CInt(Me.ddltype.SelectedValue), 0, CInt(Me.ddllocation.SelectedValue), "", "", "", "", False, "", "", Me.txtCF_price.Text, _
                txtci_price.Text, Me.txtcif_price.Text, Me.txtfob_price.Text, Me.txtsellingpricecode.Text, ddlwebdisplaytype.SelectedValue, _
                ddlDisplayPriority.SelectedValue, CInt(Me.ddlcurrency.SelectedValue), Me.txtsold_date.Text, CInt(ddlSellingCurr.SelectedValue), CInt(ddlImportType.SelectedValue), "")

                'Mustafa Work For Regional Cities
                If con.State = ConnectionState.Closed Then con.Open()
                cmd = New SqlCommand("delete from StockRegional where mainId = " + hID.Value, con)
                cmd.ExecuteNonQuery()
                Dim query As String

                For Each itm As DataListItem In DlReviewImages.Items
                    If itm.ItemType = ListItemType.Item OrElse itm.ItemType = ListItemType.AlternatingItem Then
                        Dim hdnID As HiddenField = DirectCast(itm.FindControl("hdnID"), HiddenField)
                        Dim chkbx As CheckBox = DirectCast(itm.FindControl("chkbx"), CheckBox)
                        If chkbx.Checked = True Then
                            query = "Insert Into StockRegional(MainID, RCID) Values(" + hID.Value + ", " + hdnID.Value + ")"
                            cmd = New SqlCommand(query, con)
                            cmd.ExecuteNonQuery()
                        End If

                    End If
                Next
                con.Close()
                'Mustafa Work For Regional Cities

                lblmsg.Text = msg.ToString
            End If

            Me.lblstatus.Text = Me.ddlstatus.SelectedValue

        Catch ex As Exception
            '  Hupdate_Flag.Value = 0

            ExUtility.LogException(ex, "SaveRecords_stockdetails")

        End Try
    End Sub
    <System.Web.Services.WebMethod()> _
Public Shared Function get_MakeNames(ByVal MakeID As Integer) As ArrayList
        Try
            Dim list As ArrayList = New ArrayList
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("autoconnectionString").ConnectionString
            Dim strQuery As String = "select ID, model_description from tblmake_details where make_ID=@make_ID"
            Dim con As SqlConnection = New SqlConnection(strConnString)
            Dim cmd As SqlCommand = New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@make_ID", MakeID)
            cmd.CommandText = strQuery
            cmd.Connection = con
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader
            While sdr.Read
                list.Add(New ListItem(sdr("model_description").ToString, sdr("ID").ToString))
            End While
            con.Close()
            Return list


        Catch ex As Exception
            Return Nothing

        End Try

    End Function


    <System.Web.Services.WebMethod()> _
Public Shared Function get_MakeCategory(ByVal CategoryID As Integer) As ArrayList
        Try
            Dim list As ArrayList = New ArrayList
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString
            Dim strQuery As String = "SELECT veh_type_id, veh_type_name FROM tb_vehicle_type where veh_cat_id = @veh_cat_id"

            Dim con As SqlConnection = New SqlConnection(strConnString)
            Dim cmd As SqlCommand = New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@veh_cat_id", CategoryID)
            cmd.CommandText = strQuery
            cmd.Connection = con
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader
            While sdr.Read
                list.Add(New ListItem(sdr("veh_type_name").ToString, sdr("veh_type_id").ToString))
            End While
            con.Close()
            Return list


        Catch ex As Exception
            Return Nothing

        End Try

    End Function



    Public Sub ResizeStream(ByVal imageSize As Integer, ByVal filePath As String, ByVal outputPath As String)
        Dim image1 = Image.FromFile(filePath)

        Dim thumbnailSize As Integer = imageSize
        Dim newWidth As Integer, newHeight As Integer

        If image1.Width > image1.Height Then
            newWidth = thumbnailSize
            newHeight = image1.Height * thumbnailSize / image1.Width
        Else
            newWidth = image1.Width * thumbnailSize / image1.Height
            newHeight = thumbnailSize
        End If

        Dim thumbnailBitmap = New Bitmap(newWidth, newHeight)

        Dim thumbnailGraph = Graphics.FromImage(thumbnailBitmap)
        thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality
        thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality
        thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic

        Dim imageRectangle = New Rectangle(0, 0, newWidth, newHeight)
        thumbnailGraph.DrawImage(image1, imageRectangle)

        thumbnailBitmap.Save(outputPath, image1.RawFormat)

        thumbnailGraph.Dispose()
        thumbnailBitmap.Dispose()
        image1.Dispose()




    End Sub







    Protected Sub cmdSave2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdSave2.Click


        Upload_Files()
        Save_Record()

    End Sub
    Sub ServerSideValidation(ByVal sender As Object, ByVal value As ServerValidateEventArgs)

        Try
            If Char.IsLetterOrDigit(CChar(value.Value)) = True Then
                value.IsValid = True
            Else
                value.IsValid = False
            End If

        Catch ex As Exception


        End Try


    End Sub
    Private Sub Load_Combo_whr(ByVal ddl As DropDownList, ByVal ID As String)

        Try
            Dim obj As New dsStockTableAdapters.Get_ModelNamesAdminTableAdapter

            Dim dt As New DataTable
            dt.Merge(obj.get_ModelNameAdmin(ID))
            ddl.DataTextField = "MODEL_DESCRIPTION"
            ddl.DataValueField = "ID"
            ddl.DataSource = dt
            ddl.DataBind()


        Catch ex As Exception

        End Try
    End Sub

    Private Sub Load_ListBox(ByVal LBox As ListBox)

        Try
            Dim obj As New masterdataTableAdapters.display_typeTableAdapter

            Dim dt As New DataTable
            dt.Merge(obj.GetData())
            LBox.DataTextField = "display_type"
            LBox.DataValueField = "ID"
            LBox.DataSource = dt
            LBox.DataBind()


        Catch ex As Exception

            ExUtility.LogException(ex, "listbox")

        End Try
    End Sub



    Private Sub Load_Vehicle_Type(ByVal ddl As DropDownList, ByVal ID As String)

        Try
            Dim obj As New dsStockTableAdapters.Get_VehTypeAdminTableAdapter

            Dim dt As New DataTable
            dt.Merge(obj.Get_VehTypeName(ID))
            ddl.DataTextField = "veh_type_name"
            ddl.DataValueField = "veh_type_id"
            ddl.DataSource = dt
            ddl.DataBind()




        Catch ex As Exception

            ExUtility.LogException(ex, "listbox")

        End Try
    End Sub

    Sub SAVE_FILES(ByVal Img As System.Web.UI.WebControls.Image, ByVal FileUPLOAD As FileUpload, ByVal file_name As String, ByVal Hidden_Name As HiddenField)
        Try
        
            Dim FilePath As String = String.Empty

            Dim StockImagesPath As String = ConfigurationManager.AppSettings.Get("stockimages_path")

            file_name = New_Image_ID() & "_" & file_name


            If FileUPLOAD.FileContent.Length > 200000 Then
                lblattachmentmsg.Text = "File is too big. Maximum file size is 200KB"
            Else


                Dim vPath As String = "~" & StockImagesPath


                FilePath = Server.MapPath(vPath)



                Try


                    FileUPLOAD.SaveAs(FilePath & "\" & file_name)



                Catch ex As Exception
                    ExUtility.LogException(ex, "error_FileUPLOAD")
                End Try
                Img.ImageUrl = vPath & "\" & file_name
                Hidden_Name.Value = file_name
                lblattachmentmsg.Text = "File uploaded and saved"

            End If





        Catch ex As Exception




        End Try






    End Sub
    Sub SAVE_FILES_OLD(ByVal Img As System.Web.UI.WebControls.Image, ByVal FileUPLOAD As FileUpload, ByVal file_name As String, ByVal Hidden_Name As HiddenField)
        Try
            Dim FilePath As String = String.Empty

            Dim StockImagesPath As String = ConfigurationManager.AppSettings.Get("stockimages_path")




            If FileUPLOAD.FileContent.Length > 200000 Then
                lblattachmentmsg.Text = "File is too big. Maximum file size is 200KB"
            Else


                Dim vPath As String = "~" & StockImagesPath
                ExUtility.LogMsg(vPath, "inside_savefile_vpath")

                FilePath = Server.MapPath(vPath)

                ExUtility.LogMsg(FilePath, "inside_savefile_filepath")

                Try

                    ExUtility.LogMsg(FilePath & "\" & file_name, "saveas_Started....")

                    FileUPLOAD.SaveAs(FilePath & "\" & file_name)

                    ExUtility.LogMsg(FilePath & "\" & file_name, "saveas_Ending....")

                Catch ex As Exception

                    ExUtility.LogException(ex, "error_FileUPLOAD")

                End Try



                Img.ImageUrl = vPath & "\" & file_name
                Hidden_Name.Value = file_name



                lblattachmentmsg.Text = "File uploaded and saved"




            End If





        Catch ex As Exception




        End Try
    End Sub


    Private Sub Upload_Files()
        Try


            If FileUpload1.HasFile = True And cmdupload1.Text.ToLower = "add" Then


                SAVE_FILES(Image1, FileUpload1, FileUpload1.FileName, HiddenField1)
                cmdupload1.Text = "remove"



            End If

            If FileUpload2.HasFile = True And cmdupload2.Text.ToLower = "add" Then

                SAVE_FILES(Image2, FileUpload2, FileUpload2.FileName, HiddenField2)
                cmdupload2.Text = "remove"


            End If


            If FileUpload3.HasFile = True And cmdupload3.Text.ToLower = "add" Then
                SAVE_FILES(Image3, FileUpload3, FileUpload3.FileName, HiddenField3)
                cmdupload3.Text = "remove"

            End If

            If FileUpload4.HasFile = True And cmdupload4.Text.ToLower = "add" Then
                SAVE_FILES(Image4, FileUpload4, FileUpload4.FileName, HiddenField4)
                cmdupload4.Text = "remove"
            End If

            If FileUpload5.HasFile = True And cmdupload5.Text.ToLower = "add" Then
                SAVE_FILES(Image5, FileUpload5, FileUpload5.FileName, HiddenField5)
                cmdupload5.Text = "remove"
            End If


            If FileUpload6.HasFile = True And cmdupload6.Text.ToLower = "add" Then
                SAVE_FILES(Image6, FileUpload6, FileUpload6.FileName, HiddenField6)
                cmdupload6.Text = "remove"

            End If

            If FileUpload7.HasFile = True And cmdupload7.Text.ToLower = "add" Then
                SAVE_FILES(Image7, FileUpload7, FileUpload7.FileName, HiddenField7)
                cmdupload7.Text = "remove"

            End If

            If FileUpload8.HasFile = True And cmdupload8.Text.ToLower = "add" Then
                SAVE_FILES(Image8, FileUpload8, FileUpload8.FileName, HiddenField8)
                cmdupload8.Text = "remove"

            End If

            If FileUpload9.HasFile = True And cmdupload9.Text.ToLower = "add" Then
                SAVE_FILES(Image9, FileUpload9, FileUpload9.FileName, HiddenField9)
                cmdupload9.Text = "remove"

            End If

            If FileUpload10.HasFile = True And cmdupload10.Text.ToLower = "add" Then
                SAVE_FILES(Image10, FileUpload10, FileUpload10.FileName, HiddenField10)
                cmdupload10.Text = "remove"

            End If



        Catch ex As Exception

            ExUtility.LogException(ex, "Upload_Files")

        End Try
    End Sub
    Private Sub Remove_Files()
        Try



            Dim StockImagesPath As String = ConfigurationManager.AppSettings.Get("stockimages_path")

           
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)

            If cmdupload1.Text.ToLower = "remove" Then

             

                Image1.ImageUrl = "~/imagecar/noimage.PNG"



                File.Delete(FilePath & "/" & HiddenField1.Value)



                cmdupload1.Text = "Add"

              

            End If






            If cmdupload2.Text.ToLower = "remove" Then

                Image2.ImageUrl = "~/imagecar/noimage.PNG"
            
                File.Delete(FilePath & "/" & HiddenField2.Value)
                cmdupload2.Text = "Add"

            

            End If




            If cmdupload3.Text.ToLower = "remove" Then
                Image3.ImageUrl = "~/imagecar/noimage.PNG"
             
                File.Delete(FilePath & "/" & HiddenField3.Value)
                cmdupload3.Text = "Add"

             

             


            End If



            If cmdupload4.Text.ToLower = "remove" Then
                Image4.ImageUrl = "~/imagecar/noimage.PNG"
             
                File.Delete(FilePath & "/" & HiddenField4.Value)

                cmdupload4.Text = "Add"

             



            End If




            If cmdupload5.Text.ToLower = "remove" Then
                Image5.ImageUrl = "~/imagecar/noimage.PNG"
            
                File.Delete(FilePath & "/" & HiddenField5.Value)
                cmdupload5.Text = "Add"

            

            End If

            If cmdupload6.Text.ToLower = "remove" Then
                Image6.ImageUrl = "~/imagecar/noimage.PNG"
                File.Delete(FilePath & "/" & HiddenField6.Value)
                cmdupload6.Text = "Add"

             

            End If


            If cmdupload7.Text.ToLower = "remove" Then
                Image7.ImageUrl = "~/imagecar/noimage.PNG"

            

                File.Delete(FilePath & "/" & HiddenField7.Value)
                cmdupload7.Text = "Add"


            End If

            If cmdupload8.Text.ToLower = "remove" Then
                Image8.ImageUrl = "~/imagecar/noimage.PNG"

             
                File.Delete(FilePath & "/" & HiddenField8.Value)
                cmdupload8.Text = "Add"

            

            End If

            If cmdupload9.Text.ToLower = "remove" Then
                Image9.ImageUrl = "~/imagecar/noimage.PNG"

             
                File.Delete(FilePath & "/" & HiddenField9.Value)
                cmdupload9.Text = "Add"

             

            End If

            If cmdupload10.Text.ToLower = "remove" Then
                Image10.ImageUrl = "~/imagecar/noimage.PNG"

            
                File.Delete(FilePath & "/" & HiddenField10.Value)
                cmdupload10.Text = "Add"

            

            End If






        Catch ex As Exception

            ExUtility.LogException(ex, "Remove_Files")
        End Try
    End Sub


    Protected Sub cmdUpload1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload1.Click
        Try

       
            If Me.cmdupload1.Text = "Add" Then

            Else
                cmdupload1.Text = "Add"
                Image1.ImageUrl = "~/imagecar/noimage.PNG"
                Dim FilePath As String = Server.MapPath("~" & StockImagesPath)

                File.Delete(FilePath & "\" & HiddenField1.Value)

                HiddenField1.Value = "noimage.png"



            End If


        Catch ex As Exception

            ExUtility.LogException(ex, "cmdUpload1_click")

        End Try

    End Sub

  


    Protected Sub cmdUpload2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload2.Click



        If Me.cmdupload2.Text = "Add" Then




        Else
            cmdupload2.Text = "Add"
            Image2.ImageUrl = "~/imagecar/noimage.PNG"
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField2.Value)

            HiddenField2.Value = "noimage.png"


        End If
    End Sub

    Protected Sub cmdUpload3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload3.Click
        If Me.cmdupload3.Text = "Add" Then

        Else
            cmdupload3.Text = "Add"
            Image3.ImageUrl = "~/imagecar/noimage.PNG"
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField3.Value)

            HiddenField3.Value = "noimage.png"



        End If
    End Sub

    Protected Sub cmdUpload4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload4.Click
        If Me.cmdupload4.Text = "Add" Then

        Else
            cmdupload4.Text = "Add"
            Image4.ImageUrl = "~/imagecar/noimage.PNG"
              Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField4.Value)

            HiddenField4.Value = "noimage.png"



        End If
    End Sub

    Protected Sub cmdUpload5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload5.Click
        If Me.cmdupload5.Text = "Add" Then

        Else
            cmdupload5.Text = "Add"

            Image5.ImageUrl = "~/imagecar/noimage.PNG"
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)

            File.Delete(FilePath & "\" & HiddenField5.Value)
            HiddenField5.Value = "noimage.png"




        End If
    End Sub

    Protected Sub cmdUpload6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload6.Click
        If Me.cmdupload6.Text = "Add" Then

        Else
            cmdupload6.Text = "Add"
            Image6.ImageUrl = "~/imagecar/noimage.PNG"
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)

            File.Delete(FilePath & "\" & HiddenField6.Value)

            HiddenField6.Value = "noimage.png"

        End If
    End Sub

    Protected Sub cmdUpload7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload7.Click
        If Me.cmdupload7.Text = "Add" Then

        Else
            cmdupload7.Text = "Add"
            Image7.ImageUrl = "~/imagecar/noimage.PNG"
              Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField7.Value)

            HiddenField7.Value = "noimage.png"

        End If
    End Sub

    Protected Sub cmdUpload8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload8.Click
        If Me.cmdupload8.Text = "Add" Then

        Else
            cmdupload8.Text = "Add"
            Image8.ImageUrl = "~/imagecar/noimage.PNG"
              Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField8.Value)

            HiddenField8.Value = "noimage.png"

        End If
    End Sub

    Protected Sub cmdUpload9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload9.Click
        If Me.cmdupload9.Text = "Add" Then

        Else
            cmdupload9.Text = "Add"
            Image9.ImageUrl = "~/imagecar/noimage.PNG"
              Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField9.Value)

            HiddenField9.Value = "noimage.png"

        End If
    End Sub

    Protected Sub cmdUpload10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdupload10.Click
        If Me.cmdupload10.Text = "Add" Then

        Else
            cmdupload10.Text = "Add"
            Image10.ImageUrl = "~/imagecar/noimage.PNG"
            Dim FilePath As String = Server.MapPath("~" & StockImagesPath)
            File.Delete(FilePath & "\" & HiddenField10.Value)

            HiddenField10.Value = "noimage.png"

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not Page.IsPostBack Then
                StockImagesPath = ConfigurationManager.AppSettings.Get("stockimages_path")

                If Not Request.QueryString("ID") Is Nothing Then
                    hID.Value = Request.QueryString("id")
                    Display_Data(hID.Value)
                    Hupdate_Flag.Value = 1
                    Using con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString)
                        Using da = New SqlDataAdapter("select * from dbo.StockRegional where MAinId = " + hID.Value, con)
                            Dim table = New DataTable()
                            da.Fill(table)
                            If table Is Nothing Then

                            Else
                                If table.Rows.Count > 0 Then
                                    For Each itm As DataListItem In DlReviewImages.Items
                                        Dim chkbx As CheckBox = DirectCast(itm.FindControl("chkbx"), CheckBox)
                                        Dim hdnID As HiddenField = DirectCast(itm.FindControl("hdnID"), HiddenField)
                                        If itm.ItemType = ListItemType.Item OrElse itm.ItemType = ListItemType.AlternatingItem Then
                                            For Each row As DataRow In table.Rows
                                                Dim MAinID As String = row.Item("RCID")
                                                If MAinID = hdnID.Value Then
                                                    chkbx.Checked = True
                                                End If
                                            Next row

                                        End If
                                    Next
                                End If
                            End If
                        End Using
                    End Using
                Else
                    Me.Load_ListBox(ddlwebdisplaytype)
                End If
            End If
        Catch ex As Exception
        End Try
    End Sub


    Private Sub Display_Data(ByVal ID As String)
        Try


            Dim obj As New dsStockTableAdapters.Select_StockTableAdapter
            Dim dt As New DataTable

            dt.Merge(obj.GetData(ID))



            With Me

                Me.Load_ListBox(Me.ddlwebdisplaytype)


                .ddlmake.SelectedValue = dt.Rows(0).Item("make_id").ToString


                .hID.Value = dt.Rows(0).Item("id")
                .txtfile_ref.Text = dt.Rows(0).Item("file_ref").ToString
                .txtchassisno.Text = dt.Rows(0).Item("chassis_no").ToString


                .lblstatus.Text = dt.Rows(0).Item("availability").ToString
                ddllocation.SelectedValue = dt.Rows(0).Item("VEH_LOCATION_ID").ToString

                ' .ddllocation.SelectedValue = dt.Rows(0).Item("locID").ToString
                .ddlShowroom.SelectedValue = dt.Rows(0).Item("showroom_id").ToString
                .ddlmake_category.SelectedValue = dt.Rows(0).Item("veh_cat_id").ToString.Trim
                '   Me.Load_Combo_whr(ddlMakeModel, dt.Rows(0).Item("make_id").ToString)
                .txtentry_date.Text = dt.Rows(0).Item("entry_date").ToString
                .txtmodel.Text = dt.Rows(0).Item("model").ToString.Trim
                .ddlcolor.SelectedValue = dt.Rows(0).Item("COLOR_ID").ToString.Trim
                .ddlInteriorColor.SelectedValue = dt.Rows(0).Item("interior_color_id").ToString.Trim
                ' Load_Vehicle_Type(Me.ddltype, dt.Rows(0).Item("veh_cat_id").ToString.Trim)
                .ddltransmission.SelectedValue = dt.Rows(0).Item("TRANSMISSION").ToString.Trim
                .ddldoor.SelectedValue = dt.Rows(0).Item("door").ToString.Trim
                .ddlcurrency.SelectedValue = dt.Rows(0).Item("currency_id").ToString
                .ddlSellingCurr.SelectedValue = dt.Rows(0).Item("selling_curr_id").ToString

                .txtsold_date.Text = dt.Rows(0).Item("sold_date").ToString

                ddlstatus.SelectedValue = dt.Rows(0).Item("availability").ToString



                Dim s() As String
                s = dt.Rows(0).Item("display_type").ToString.Split(",")




                For j As Integer = 0 To s.Length - 1

                    For i As Integer = 0 To ddlwebdisplaytype.Items.Count - 1
                        If Me.ddlwebdisplaytype.Items(i).Value = s(j) Then
                            Me.ddlwebdisplaytype.Items(i).Selected = True
                        End If

                    Next
                Next


                Me.ddlcountry.SelectedValue = dt.Rows(0).Item("GlobalLocationID").ToString


                .ddlmake_category.SelectedValue = dt.Rows(0).Item("veh_cat_id").ToString.Trim


                txtmileage.Text = dt.Rows(0).Item("mileage").ToString
                txtseats.Text = dt.Rows(0).Item("seat").ToString
                txtCC.Text = dt.Rows(0).Item("cc").ToString

                txtlenght.Text = dt.Rows(0).Item("veh_length").ToString
                txtheight.Text = dt.Rows(0).Item("veh_height").ToString
                txtwidth.Text = dt.Rows(0).Item("veh_width").ToString
                txtweight.Text = dt.Rows(0).Item("weight").ToString


                txtfob_price.Text = dt.Rows(0).Item("fob_price").ToString
                txtci_price.Text = dt.Rows(0).Item("ci_price").ToString
                txtcif_price.Text = dt.Rows(0).Item("cif_price").ToString
                txtCF_price.Text = dt.Rows(0).Item("cf_price").ToString



                txtsellingpricecode.Text = dt.Rows(0).Item("web_price").ToString





                ddlMakeName.SelectedValue = dt.Rows(0).Item("make_model_id").ToString.Trim


                .txtoptions.Text = dt.Rows(0).Item("OPTIONS").ToString

                .txtHsCode.Text = dt.Rows(0).Item("HS_CODE").ToString

                .rdbdrive.SelectedValue = dt.Rows(0).Item("DRIVE").ToString

                .ddlFuel.SelectedValue = dt.Rows(0).Item("fuel_type_id").ToString.Trim
                rdbused.SelectedValue = dt.Rows(0).Item("used_new").ToString

                ddlmake_country.SelectedValue = dt.Rows(0).Item("make_country").ToString
                .txtengine_no.Text = dt.Rows(0).Item("ENGINE_NO").ToString

                HiddenField1.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image1").ToString), "noimage.png", dt.Rows(0).Item("image1").ToString)

                HiddenField2.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image2").ToString), "noimage.png", dt.Rows(0).Item("image2").ToString)
                HiddenField3.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image3").ToString), "noimage.png", dt.Rows(0).Item("image3").ToString)
                HiddenField4.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image4").ToString), "noimage.png", dt.Rows(0).Item("image4").ToString)
                HiddenField5.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image5").ToString), "noimage.png", dt.Rows(0).Item("image5").ToString)
                HiddenField6.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image6").ToString), "noimage.png", dt.Rows(0).Item("image6").ToString)
                HiddenField7.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image7").ToString), "noimage.png", dt.Rows(0).Item("image7").ToString)

                HiddenField8.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image8").ToString), "noimage.png", dt.Rows(0).Item("image8").ToString)

                HiddenField9.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image9").ToString), "noimage.png", dt.Rows(0).Item("image9").ToString)

                HiddenField10.Value = IIf(String.IsNullOrEmpty(dt.Rows(0).Item("image10").ToString), "noimage.png", dt.Rows(0).Item("image10").ToString)







                If HiddenField1.Value = "noimage.png" Then
                    Image1.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload1.Text = "remove"
                    Image1.ImageUrl = "~" & StockImagesPath & "/" & HiddenField1.Value
                End If

                If HiddenField2.Value = "noimage.png" Then
                    Image2.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload2.Text = "remove"
                    Image2.ImageUrl = "~" & StockImagesPath & "/" & HiddenField2.Value
                End If
                If HiddenField3.Value = "noimage.png" Then
                    Image3.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload3.Text = "remove"
                    Image3.ImageUrl = "~" & StockImagesPath & "/" & HiddenField3.Value
                End If
                If HiddenField4.Value = "noimage.png" Then
                    Image4.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload4.Text = "remove"
                    Image4.ImageUrl = "~" & StockImagesPath & "/" & HiddenField4.Value
                End If

                If HiddenField5.Value = "noimage.png" Then
                    Image5.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload5.Text = "remove"
                    Image5.ImageUrl = "~" & StockImagesPath & "/" & HiddenField5.Value
                End If
                If HiddenField6.Value = "noimage.png" Then
                    Image6.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload6.Text = "remove"
                    Image6.ImageUrl = "~" & StockImagesPath & "/" & HiddenField6.Value
                End If

                If HiddenField7.Value = "noimage.png" Then
                    Image7.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload7.Text = "remove"
                    Image7.ImageUrl = "~" & StockImagesPath & "/" & HiddenField7.Value
                End If

                If HiddenField8.Value = "noimage.png" Then
                    Image8.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload8.Text = "remove"
                    Image8.ImageUrl = "~" & StockImagesPath & "/" & HiddenField8.Value
                End If

                If HiddenField9.Value = "noimage.png" Then
                    Image9.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload9.Text = "remove"
                    Image9.ImageUrl = "~" & StockImagesPath & "/" & HiddenField9.Value
                End If

                If HiddenField10.Value = "noimage.png" Then
                    Image10.ImageUrl = "~/imagecar/noimage.png"
                Else
                    cmdupload10.Text = "remove"
                    Image10.ImageUrl = "~" & StockImagesPath & "/" & HiddenField10.Value
                End If


                txtop_yen.Text = dt.Rows(0).Item("O_P_YEN").ToString
                txtOP_dhs.Text = dt.Rows(0).Item("O_P").ToString
                txtOP_yen_rate.Text = dt.Rows(0).Item("O_P_RATE").ToString
                txtfreight_yen.Text = dt.Rows(0).Item("FREIGHT_YEN").ToString



                chkdvd.Checked = dt.Rows(0).Item("dvd")
                chkMD_Player.Checked = dt.Rows(0).Item("md_player")
                chkTV_NAVI.Checked = dt.Rows(0).Item("tv_nav")
                chkAirbag.Checked = dt.Rows(0).Item("airbag")
                chkDual_Airbag.Checked = dt.Rows(0).Item("Dual_Airbag")
                chkSun_Roof.Checked = dt.Rows(0).Item("Sun_Roof")
                chkTwin_Sun_Roof.Checked = dt.Rows(0).Item("Twin_Sun_Roof")
                chk4x4.Checked = dt.Rows(0).Item("4WD")
                chk6x6.Checked = dt.Rows(0).Item("6x6")
                chkLeather_Seats.Checked = dt.Rows(0).Item("Leather_Seats")
                chkDigital_Meter.Checked = dt.Rows(0).Item("Digital_Meter")
                chkBack_Tyre.Checked = dt.Rows(0).Item("Back_Tyre")
                chkFender_Mirror.Checked = dt.Rows(0).Item("Fender_Mirror")
                chkGuard_Grill.Checked = dt.Rows(0).Item("Guard_Grill")
                chkFog_Lights.Checked = dt.Rows(0).Item("Fog_Lights")
                chkBack_Censor.Checked = dt.Rows(0).Item("Back_Censor")
                chkbackcamera.Checked = dt.Rows(0).Item("Back_Camera")
                chkToll_Tax_Dedector.Checked = dt.Rows(0).Item("Toll_Tax_Dedector")
                chkRoofRail.Checked = dt.Rows(0).Item("RoofRail")
                chkBodyKit.Checked = dt.Rows(0).Item("BodyKit")
                chkSeat_Heater.Checked = dt.Rows(0).Item("Seat_Heater")
                chkCD_Changer.Checked = dt.Rows(0).Item("CD_Changer")
                chkOne_Owner.Checked = dt.Rows(0).Item("One_Owner")
                chkRear_Spoiler.Checked = dt.Rows(0).Item("Rear_Spoiler")
                chkFront_Spoiler.Checked = dt.Rows(0).Item("Front_Spoiler")
                chkTool_Kit.Checked = dt.Rows(0).Item("Tool_Kit")
                chkExtra_Tyre.Checked = dt.Rows(0).Item("Extra_Tyre")
                chkAC.Checked = dt.Rows(0).Item("ac")
                chkPS.Checked = dt.Rows(0).Item("ps")
                chkPW.Checked = dt.Rows(0).Item("pw")


                chkP_MIR.Checked = dt.Rows(0).Item("p_mir")
                chkPLK.Checked = dt.Rows(0).Item("plk")

                chkkey_less.Checked = dt.Rows(0).Item("key_less")

                chkaw.Checked = dt.Rows(0).Item("aw")

                chkabs.Checked = dt.Rows(0).Item("abs")

                chkwac.Checked = dt.Rows(0).Item("wac")
                chkaac.Checked = dt.Rows(0).Item("aac")
                chkCAS.Checked = dt.Rows(0).Item("cas")

                ddltype.SelectedValue = dt.Rows(0).Item("veh_type_id").ToString

                If Me.lblstatus.Text.ToUpper = "SOLD" Then
                    Me.lblstatus.ForeColor = Drawing.Color.Green

                Else
                    Me.lblstatus.ForeColor = Drawing.Color.Red

                End If


                Me.ddlDisplayPriority.SelectedValue = dt.Rows(0).Item("display_priority").ToString

                ddlC_type.SelectedValue = dt.Rows(0).Item("C_TYPE").ToString

                ddlImportType.SelectedValue = dt.Rows(0).Item("import_type_ID").ToString


            End With



        Catch ex As Exception

            ExUtility.LogException(ex, "Display_Data_details")



        End Try
    End Sub
    'Protected Sub ddlmake_category_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlmake_category.SelectedIndexChanged
    '    Load_Vehicle_Type(Me.ddltype, Me.ddlmake_category.SelectedValue)
    'End Sub

    Protected Sub cmdUpload_all_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdUpload_all.Click
        Try

            Upload_Files()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub cmdDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdDelete.Click
        Try
            Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString)
            Dim cmd As SqlCommand
            Dim obj As New dsStockTableAdapters.newSTOCK_LISTTableAdapter
            Me.lblmsg.Text = obj.Delete_Stock(hID.Value)
            If con.State = ConnectionState.Closed Then con.Open()
            cmd = New SqlCommand("delete from StockRegional where mainId = " + hID.Value, con)
            cmd.ExecuteNonQuery()
            con.Close()
            Remove_Files()

            Clear_Text()


        Catch ex As Exception

        End Try
    End Sub


    Private Sub Clear_Text()
        Try

            With Me
                .txtchassisno.Text = String.Empty

                .txtbrand.Text = String.Empty
                .txtCC.Text = String.Empty
                .txtCF_price.Text = String.Empty
                .txtengine_no.Text = String.Empty
                .txtfile_ref.Text = String.Empty
                .txtfreight_yen.Text = String.Empty
                .txtHsCode.Text = String.Empty
                .txtmileage.Text = String.Empty
                .txtop_yen.Text = String.Empty
                .txtOP_dhs.Text = String.Empty
                .txtOP_yen_rate.Text = String.Empty
                .txtCF_price.Text = String.Empty
                .txtcif_price.Text = String.Empty
                .txtfob_price.Text = String.Empty
                .txtoptions.Text = String.Empty
                .txtseats.Text = String.Empty


                .txtsellingpricecode.Text = String.Empty
                .txtwidth.Text = String.Empty
                .txtweight.Text = String.Empty
                .txtfob_price.Text = String.Empty
                .txtlenght.Text = String.Empty
                .txtheight.Text = String.Empty
                .txtmodel.Text = String.Empty
                .txtci_price.Text = String.Empty
                .txtentry_date.Text = String.Empty

                .ddlcolor.SelectedValue = 0
                .ddlcountry.SelectedValue = 0
                .ddlDisplayPriority.SelectedValue = 0
                .ddldoor.SelectedValue = ""
                .ddlFuel.SelectedValue = 0
                .ddlInteriorColor.SelectedValue = 0
                .ddllocation.SelectedValue = 0
                .ddlmake.SelectedValue = 0
                .ddlmake_category.SelectedValue = 0
                .ddlmake_country.SelectedValue = ""
                .ddlMakeName.SelectedValue = 0
                .ddlShowroom.SelectedValue = ""
                .ddlstatus.SelectedValue = 0
                .ddltransmission.SelectedValue = ""
                .ddltype.SelectedValue = 0
                ' .ddlwebdisplaytype.SelectedValue = 0
                .ddltype.SelectedValue = 0
                .rdbdrive.SelectedValue = "Left Hand"
                .lblstatus.Text = String.Empty
                .txtsold_date.Text = String.Empty
                .ddlstatus.SelectedValue = "STOCK"
                .ddlcurrency.SelectedValue = 0

                Me.ddlDisplayPriority.SelectedValue = "None"

                ddlwebdisplaytype.DataSource = Nothing


                chkdvd.Checked = False
                chkMD_Player.Checked = False
                chkTV_NAVI.Checked = False
                chkAirbag.Checked = False
                chkDual_Airbag.Checked = False
                chkSun_Roof.Checked = False
                chkTwin_Sun_Roof.Checked = False
                chk4x4.Checked = False
                chk6x6.Checked = False
                chkLeather_Seats.Checked = False
                chkDigital_Meter.Checked = False
                chkBack_Tyre.Checked = False
                chkFender_Mirror.Checked = False
                chkGuard_Grill.Checked = False
                chkFog_Lights.Checked = False
                chkBack_Censor.Checked = False
                chkbackcamera.Checked = False
                chkToll_Tax_Dedector.Checked = False
                chkRoofRail.Checked = False
                chkBodyKit.Checked = False
                chkSeat_Heater.Checked = False
                chkCD_Changer.Checked = False
                chkOne_Owner.Checked = False
                chkRear_Spoiler.Checked = False
                chkFront_Spoiler.Checked = False
                chkTool_Kit.Checked = False
                chkExtra_Tyre.Checked = False
                chkAC.Checked = False
                chkPS.Checked = False
                chkPW.Checked = False
                chkP_MIR.Checked = False
                chkPLK.Checked = False
                chkkey_less.Checked = False
                chkaw.Checked = False
                chkabs.Checked = False
                chkwac.Checked = False
                chkaac.Checked = False
                chkCAS.Checked = False


                Remove_Files()




            End With



        Catch ex As Exception

        End Try
    End Sub

End Class
